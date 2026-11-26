# Scripts

Python scripts import `lib.py` (RPC helper, addresses, event topics), so run them from this
folder or with it on the path. Collectors read the public MegaETH RPC, which rate-limits; they
retry and sleep between calls.

## Collect

| Script | What it does |
|---|---|
| `collect_events.py FROM TO out.jsonl` | Opens, USDm transfers into the Exchange and settlements, in 50,000-block chunks (source of the `euphoria_*.csv.gz` files) |
| `collect_settled.py FROM TO out.jsonl` | One line per settled position: blocks, taker, both stakes, outcome (source of `settled_*.csv.gz`) |
| `collect_positions.py FROM TO out.json` | Positions with full tile parameters, decoded from the open and settle transactions, including the signed RedStone payload |
| `collect_windows.py FROM TO out.json` | One settlement per block, giving each 5 s window's low/high for every market |
| `bolt_feed.py FROM TO prefix SYM ...` | RedStone Bolt ticks from the feed adapter's logs |
| `binance_trades.py SYMBOL t0 t1 out.npy` | Binance spot trades onto a 100 ms grid |
| `to_grid.py in.npy out.csv` | Ticks to a gapless 100 ms CSV |
| `venues/record.mjs SECONDS out.csv` | Live BTC trades from eight venues at once (Node 22+) |

## Analyse

| Script | Result |
|---|---|
| `economics.py [release] [data]` | All-time trades, wallets, volume, concentration, monthly revenue |
| `margin.py settled.csv.gz` | Quoted against actual win rate and share of stakes returned, by multiplier, stake size and taker |
| `bmfit.py fills.json` | The house-generated market's random-walk pricing fit (volatility, margin factor, quote lag) |
| `e11fit.py fills.json` | The earlier descriptive fit (exponential fall-off with distance), kept for comparison |
| `ethpub.py`, `ethbolt.py` | ETH pricing attempts against Binance and Bolt prices (as used; they read intermediate arrays built during the research) |
| `venues/analyze.py`, `venues/boltlag.py` | Which venue moves first; Bolt BTC lag (as used; read `bolt_btc.npy` built with `bolt_feed.py`) |
