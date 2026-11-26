# Open questions, corrections and method

## Not recovered

- **The real-asset multiplier formula.** See [pricing.md](pricing.md). Getting further needs
  hours of live quote grids, which need a logged-in session.
- **Per-user cap values and the slippage setting's units.** Served only after login.
- **Who runs the largest accounts.**
- **"Snappy" and "Storm" pricing.** No trades had happened when they were checked.

The site is geo-blocked in the US. This research did not work around that: everything comes from
public chain data, the public web bundle and public exchange data.

## Corrections to earlier drafts

- An exponential fall-off law fitted to one 3-minute ETH recording did not generalise: applied to
  5,336 on-chain ETH fills from Oct 23 it was about 30% off.
- An apparent week-to-week drift in the house-generated market's pricing came from that curve
  fit, not from Euphoria; the random-walk formula is stable across weeks.
- "New wallets per month" figures in an earlier summary read files out of order;
  `scripts/economics.py` reads them chronologically.

## Method

- **Chain data** comes from the public MegaETH RPC (`https://mainnet.megaeth.com/rpc`) through
  `eth_getLogs`. MegaETH makes about one block per second; block ≈ unix seconds − 1,762,797,011.
- **The quote price at fill time** is not on-chain. Fills landing in the same second share one
  price, so the scripts solve for the price that best explains them, then fit the pricing law.
- **Fill timing**: each bet sits between two Bolt updates in its block, which carry microsecond
  timestamps, so fills can be timed to within 50 ms.
- **Exchange data** comes from Binance's public market-data endpoints (`data-api.binance.vision`,
  `data-stream.binance.vision`) and the venues' public websockets.
