// Records BTC trades from many venues at once: venue, exchange timestamp (ms), local receive time (ms), price.
// node record.mjs <seconds> out.csv
import { createWriteStream } from "node:fs";
const secs = Number(process.argv[2] ?? 1200), out = createWriteStream(process.argv[3] ?? "trades.csv");
out.write("venue,exch_ms,recv_ms,price,qty\n");
const now = () => performance.timeOrigin + performance.now();
const counts = {};
const rec = (v, t, p, q) => { counts[v] = (counts[v] ?? 0) + 1; out.write(`${v},${t},${now().toFixed(1)},${p},${q}\n`); };
const venues = [
  ["binance_spot", "wss://data-stream.binance.vision/ws/btcusdt@trade", null, (m) => m.e === "trade" && rec("binance_spot", m.T, m.p, m.q)],
  ["binance_perp", "wss://fstream.binance.com/ws/btcusdt@trade", null, (m) => m.e === "trade" && rec("binance_perp", m.T, m.p, m.q)],
  ["coinbase", "wss://ws-feed.exchange.coinbase.com", { type: "subscribe", product_ids: ["BTC-USD"], channels: ["matches"] },
    (m) => (m.type === "match" || m.type === "last_match") && rec("coinbase", Date.parse(m.time), m.price, m.size)],
  ["okx", "wss://ws.okx.com:8443/ws/v5/public", { op: "subscribe", args: [{ channel: "trades", instId: "BTC-USDT-SWAP" }, { channel: "trades", instId: "BTC-USDT" }] },
    (m) => m.data && m.data.forEach((d) => rec(d.instId === "BTC-USDT-SWAP" ? "okx_perp" : "okx_spot", d.ts, d.px, d.sz))],
  ["bybit", "wss://stream.bybit.com/v5/public/linear", { op: "subscribe", args: ["publicTrade.BTCUSDT"] }, (m) => m.data && m.data.forEach((d) => rec("bybit_perp", d.T, d.p, d.v))],
  ["deribit", "wss://www.deribit.com/ws/api/v2", { jsonrpc: "2.0", id: 1, method: "public/subscribe", params: { channels: ["trades.BTC-PERPETUAL.raw"] } },
    (m) => m.params?.data && m.params.data.forEach((d) => rec("deribit_perp", d.timestamp, d.price, d.amount))],
  ["kraken", "wss://ws.kraken.com/v2", { method: "subscribe", params: { channel: "trade", symbol: ["BTC/USD"] } },
    (m) => m.channel === "trade" && m.data && m.data.forEach((d) => rec("kraken", Date.parse(d.timestamp), d.price, d.qty))],
  ["hyperliquid", "wss://api.hyperliquid.xyz/ws", { method: "subscribe", subscription: { type: "trades", coin: "BTC" } },
    (m) => m.channel === "trades" && m.data.forEach((d) => rec("hyperliquid", d.time, d.px, d.sz))],
];
const sockets = [];
for (const [name, url, sub, on] of venues) {
  const connect = () => {
    const ws = new WebSocket(url); sockets.push(ws);
    ws.onopen = () => sub && ws.send(JSON.stringify(sub));
    ws.onmessage = (e) => { try { on(JSON.parse(String(e.data))); } catch {} };
    ws.onerror = () => {}; ws.onclose = (e) => { if (!done) { console.log(name, "closed", e.code); setTimeout(connect, 2000); } };
  };
  connect();
}
let done = false;
const ping = setInterval(() => sockets.forEach((ws) => ws.readyState === 1 && ws.url.includes("okx") && ws.send("ping")), 20000);
setTimeout(() => console.log("after 10s", JSON.stringify(counts)), 10000);
setTimeout(() => { done = true; clearInterval(ping); sockets.forEach((w) => w.close()); out.end(); console.log("done", JSON.stringify(counts)); setTimeout(() => process.exit(0), 500); }, secs * 1000);
