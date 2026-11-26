# Prices and the oracle

## Two kinds of market

| Market | Price source | Who signs the settlement price |
|---|---|---|
| ETH, BTC, SOL | RedStone Bolt, the public on-chain price stream on MegaETH | RedStone Bolt's node keys |
| "Steady", "Snappy", "Storm" (internal ids E11, E12, E13) | A price series Euphoria generates itself | One Euphoria key (`0x6d7791…29f9`) |

The house-generated markets carried almost all the volume in November 2026.

## How a price reaches the contract

Euphoria uses RedStone's "pull" design. No oracle contract is called during settlement:

- The settle transaction carries a signed data packet appended to its calldata, in RedStone's
  payload format, holding two values per market for the window (`ETH_LOW`, `ETH_HIGH`,
  `E11_LOW`, …), stamped with the window's end time.
- The Exchange embeds RedStone's consumer code (`extractTimestampsAndAssertAllAreEqual`,
  `getAuthorisedSignerIndex`, `aggregateValues`, `getUniqueSignersThreshold`,
  `validateTimestamp`). Its only outside calls during settlement are the signature-recovery
  precompile (once for the low, once for the high) and the token transfer to the winner.
- Nothing is stored. The price is used for that settlement and discarded.

RedStone describes this setup in its own post: for each asset it produces dedicated feeds for
the latest price, the window high and the window low, signed and streamed to Euphoria
([RedStone blog](https://www.redstone.finance/blog/euphoria-redstone-bolt/)).

## Real-asset settlements are checkable

The five real-asset signer addresses in the Exchange are RedStone Bolt's updater keys. Each has
tens of millions of transactions pushing prices to the Bolt adapter
(`0x897A33A0AF45b3ba097Bd6045187D622252e6AcD`). The nodes take turns, giving one price every
100 ms per asset, landing on-chain about 22 ms after the price's own timestamp. Each update
carries 11 feeds, including ETH, BTC, DOGE and the USDT and USDC dollar rates.

A window's settled low and high are the minimum and maximum of the on-chain Bolt values over
**[start + 0.2 s, start + 5.2 s]**. For 60 ETH windows on Oct 23, both values matched to all eight
decimals in 51 windows (low alone 53, high alone 56); the misses are consistent with timing jitter
at the window edges. So anyone can recompute a real-asset settlement from public logs
(`scripts/bolt_feed.py` reads them).

The app's displayed price is the same Bolt stream: recorded app ticks matched the on-chain values
96% of the time, labelled 0.2 s earlier than the chain.

Log layout of a Bolt update (`data`, 32-byte words): value (8 decimals), feed id (ASCII, right
padded), landed time (µs), data timestamp (µs), updater index.

## The feed lags the exchanges

Bolt is a smoothed blend of venues (RedStone lists Binance, Coinbase, OKX, Bitget and Kraken).
Measured on 100 ms recordings:

- **ETH:** after a Binance move, Bolt reflects about 30% of it after 0.3 s, 64% after 1 s, and
  all of it only after about 5 s. Bolt ETH is a dollar price about 0.12% below Binance's USDT
  price.
- **BTC:** Bolt's moves peak 300 to 400 ms after the exchanges'. Five seconds later it has
  absorbed 96% of a Coinbase move but about half of a Binance USDT move; part of that is the
  USDT/USD gap. Bolt BTC sat about 0.14% below Binance USDT.

Consequence: a player watching Binance sees where the settlement price is heading for several
seconds. A house that priced tiles off the settlement feed alone would lose to them. In a
simulation, quotes priced off the feed at an 8% margin returned about $1.36 per $1 to a player
watching Binance.

Euphoria's ETH quotes do lean toward the Binance-led price (best-fit weight about 0.9), but the
exact formula was not recovered (see [pricing.md](pricing.md)).

## Which exchange moves first (BTC)

19 minutes of live trades from eight venues, recorded at once (`scripts/venues/record.mjs`):

| Venue | Trades per second | Moves relative to Binance perp |
|---|---|---|
| Binance perp (BTCUSDT) | 68 | reference |
| Binance spot | 66 | same 10 ms |
| OKX perp | 31 | same 10 ms |
| Bybit perp | 44 | same 10 ms |
| Coinbase (BTC-USD) | 13 | ~50 ms later |
| Kraken | 1.5 | ~90 ms later |
| Hyperliquid | 6 | ~500 ms later |

The four leaders cannot be separated from outside: each exchange stamps trades with its own
clock. The sample was a quiet stretch with one sharp move.

## Reading Bolt live

MegaETH's websocket (`wss://mainnet.megaeth.com/ws`) supports `eth_subscribe` for logs. Bolt
ticks arrived a median 0.85 s after their own timestamp that way, against about 4.3 s when
polling the public RPC with `eth_getLogs`.
