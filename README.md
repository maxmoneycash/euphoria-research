# Euphoria research

An independent look at how [Euphoria](https://euphoria.finance), the "tap trading" app on
MegaETH, works: who takes the other side of each bet, how tiles are priced, where the prices come
from, how the house stays solvent, and how much it has made. Everything comes from public data:
MegaETH chain logs, the public web bundle, and public exchange market data. All the on-chain data
used is published here so the numbers can be checked.

Not affiliated with Euphoria or RedStone. Nothing here is financial or legal advice. This repo
contains research and data only, no app.

## Findings

- **The house is the counterparty to every bet.** One vault, owned by a 2-of-3 Safe, takes the
  other side. The player signs their stake and tile; an operator key chooses the house's stake,
  so the odds are set off-chain and not checked by the contract. ([contracts](docs/contracts.md))
- **A bet is a box.** A tile pays if the price touches a price band at any moment of a 5-second
  window. Winner takes the whole pot; the fee is zero.
- **Two kinds of market.** ETH, BTC and SOL settle on the low and high of
  [RedStone Bolt](https://docs.redstone.finance/docs/stage1-market-data/bolt/)'s public on-chain
  price stream over [start + 0.2 s, start + 5.2 s], signed by Bolt's node keys. The
  house-generated markets ("Steady", and since Nov 20 "Snappy" and "Storm") settle on a price
  Euphoria makes and signs with one key of its own. ([oracle](docs/oracle.md))
- **The house-generated market's pricing is solved.** Multiplier = 1 / the exact touch
  probability of a random walk with volatility 0.61 tiles per √s, quoted about 4 s before the fill
  lands, with no margin factor. Held-out fills predicted to about 4.5%. ([pricing](docs/pricing.md))
- **The real-asset formula is not.** It carries internal state that cannot be seen from outside;
  the best outside model is about 10 to 14% off.
- **The settlement feed lags the exchanges.** Bolt ETH absorbs about 30% of a Binance move after
  0.3 s and all of it only after about 5 s, so a house pricing off the feed alone would lose to
  players watching Binance.
- **Money.** From launch (Apr 1, 2026) to Nov 21, 2026: 5,093,088 trades from 3,597 wallets,
  $6.71M staked, $6.54M paid out, about **$164,000** kept by the house (2.45% of volume). More
  than half of that came in May. The top wallet is 24% of all volume; the top 10 are 58%.
  ([economics](docs/economics.md))
- **Solvency** rests on the house's own bankroll ($35,000 deposited, the rest accumulated
  winnings), small open exposure, a margin on real assets (players got back 96% in late October),
  and operator control. Nothing on-chain guarantees it.
- **Running costs on-chain are negligible**: about 2.1 ETH of gas over 6.3 million transactions.
- **Economically, it is a house-banked game**, presented as trading.
  ([classification](docs/classification.md))

What is still unknown, and corrections to earlier drafts: [limits](docs/limits.md).

## Data

Large files are attached to the [`data-v1` release](../../releases/tag/data-v1). Blocks are
MegaETH blocks (about one per second; unix seconds ≈ block + 1,762,797,011). USDm amounts are in
whole tokens.

| File | Contents |
|---|---|
| `euphoria_opens.csv.gz` | Every position opened, launch to block 32,549,999: `block, taker` (5,093,088 rows) |
| `euphoria_stakes.csv.gz` | Every USDm transfer into the Exchange: `block, from, amount_usdm` (player stakes and vault stakes) |
| `euphoria_settles.csv.gz` | Every settlement: `block, winner, pot_usdm` |
| `settled_real_oct21-31.csv.gz` | 133,138 real-asset positions with outcomes: `open_block, settle_block, taker, taker_amount_usdm, house_amount_usdm, taker_won` |
| `settled_synthetic_nov10-20.csv.gz` | 201,695 house-generated-market positions, same columns |
| `fills_synthetic_nov20.json.gz` | 1,853 Nov 20 fills with full tile parameters plus each window's settled low/high (input to `scripts/bmfit.py`) |
| `positions_synthetic_nov20.json.gz` | 2,029 Nov 20 positions with tile, operator and settlement details including the signed feed values |
| `positions_eth_oct23.json.gz` | 5,442 ETH positions from Oct 23 with tile parameters |
| `windows_nov18.json.gz` | Settled low/high per 5 s window on Nov 18, keyed `market:start` (4,401 windows, 3,285 of them on "Steady", E11) |
| `bolt_binance_sessions_100ms.tar.gz` | RedStone Bolt and Binance spot prices on a 100 ms grid, ETH and BTC, 6-hour sessions (CSV: `unix_seconds, price`) |
| `btc_venue_race_trades.csv.gz` | 19 minutes of BTC trades from eight venues at once: `venue, exch_ms, recv_ms, price, qty` |

Small files in [`data/`](data): the vault's assets sampled every 2,000 blocks since launch
(`vault_assets.json`: `[blocks], [usdm]`) and its deposits and withdrawals (`vault_flows.json`).

## Reproduce

Python 3 with numpy and scipy (the fits), or plain Python (the totals). See
[`scripts/README.md`](scripts/README.md).

```sh
gh release download data-v1 -D release        # or download the files from the release page
python3 scripts/economics.py                   # all-time totals and monthly table
python3 scripts/margin.py release/settled_real_oct21-31.csv.gz
gunzip -k release/fills_synthetic_nov20.json.gz && python3 scripts/bmfit.py release/fills_synthetic_nov20.json
```

## License

Code: MIT. Docs and data: CC BY 4.0. See [LICENSE](LICENSE).
