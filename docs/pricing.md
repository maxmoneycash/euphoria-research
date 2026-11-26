# How tiles are priced

The contract never computes a price; each fill only carries the house stake as a number. So the
pricing was recovered from fills: a fill's quoted win chance is `p = stake / (stake + house
stake)`, and its multiplier is `1 / p`.

## House-generated markets ("Steady"): solved

The multiplier is the exact touch probability of a constant-volatility random walk, with no
margin multiplied in:

- **Volatility:** 0.61 tiles per √second (1.36 tiles per 5 s; one tile = 0.25 price units).
- **Timing:** quotes behave as if taken about 4 s before the fill lands on-chain.
- **Margin factor:** fitted at 1.00.

Let `x` be the price at window start, normal around the current price with standard deviation
`σ√t₁`. Then `P = 1 − P(stays below the band all window) − P(stays above it all window)`, each
"stays" term being `2Φ(gap / (σ√5)) − 1`, averaged over `x`. Multiplier = `1 / P`, capped at 100x.

Evidence:

- Fitted on Nov 20 fills, it predicts held-out fills with about 4.5% median error
  (`scripts/bmfit.py release/fills_synthetic_nov20.json` reproduces it).
- The same three numbers, unchanged, predict Nov 11 to 19 fills with 5.7% median error.
- The settled price series itself (3,285 windows on Nov 18, `release/windows_nov18.json.gz`) is a
  plain random walk: the average 5 s range is 2.25 tiles in every hour, with no volatility
  clustering, implying about 1.4 to 1.5 tiles per 5 s.

Quoted win chance against the formula, by multiplier:

| Multiplier | Fills | Quoted ÷ formula |
|---|---|---|
| 1.5–2x | 25 | 1.05 |
| 2–3x | 306 | 1.00 |
| 3–6x | 407 | 1.00 |
| 6–10x | 66 | 0.99 |
| 10–20x | 53 | 0.86 |

From 2x to 10x the quotes match the formula exactly. Under 2x the quote is marked up about 5%;
from 10x to 20x it pays about 14% more than the formula.

## The frontend's demo pricer (exact)

The public web app ships a demo mode that prices tiles in the browser:

1. Simulate 3,000 paths in tile units, 100 ms per tick: a momentum walk (velocity = 0.85 ×
   previous velocity + Gaussian noise) plus jumps of 1 to 2.5 tiles about every 12 seconds.
2. For each lead time (2.5 s steps) and price offset (quarter-tile steps, ±27 tiles), count the
   fraction of paths whose range over the window overlaps the tile.
3. Interpolate bilinearly; multiplier = `1 / p`, clamped to 1.01–100x, rounded to 0.01.
4. Publish 18 time columns × 50 price rows, starting two columns ahead.

It has no house margin, and it is not what production uses: fitted to production grids it misses
by 20 to 40%.

## Real assets (ETH, BTC): not solved

What is known:

- The grid is centred on the Bolt price (see [oracle.md](oracle.md)). Each grid carries a
  `volatility` number, updated once a second, that tracks Binance one-second moves with a memory
  of about 30 s and a floor in quiet periods (correlation about 0.9; not reproduced exactly).
- Same tile, same block, different players: quotes agree to about 1.5%, so there is no sign of
  per-player pricing.
- A random walk using Binance-based volatility predicts ETH fills to about 14%. A flexible
  model given the exact price, the published volatility and recent momentum, trained on 70% of
  a recorded session of production grids, was still 10% off on the rest. The grid carries
  internal state that is not observable from outside.
- A momentum lean is real but small: shifting the reference by about half of the last 3 s move
  cuts the error from 15% to 13.6%.

Explanations ruled out: wrong price or timing (exact 100 ms prices and 50 ms fill timing leave
15% error); pricing at tap time seconds earlier; noisy simulation (consecutive grids drift
smoothly); per-player grids; a random walk with free volatility (a different tile at the same
instant is still about 18% off).

## The house margin, measured from outcomes

`scripts/margin.py` on the released settled positions.

**Real assets, Oct 21–31, 2026** (133,138 positions, $408k staked): players got back
**96.1% ± 0.9%** of stakes.

| Multiplier | Positions | Quoted win chance | Actual win rate | Returned |
|---|---|---|---|---|
| 1–1.5x | 49,301 | 77.8% | 79.0% | 100.0% |
| 1.5–2x | 20,620 | 59.2% | 56.7% | 98.5% |
| 2–3x | 17,497 | 41.3% | 36.8% | 96.3% |
| 3–5x | 22,051 | 26.7% | 25.4% | 85.8% |
| 5–10x | 14,280 | 15.2% | 13.1% | 84.2% |
| 10–20x | 5,928 | 7.6% | 6.5% | 70.6% |

**House-generated market, Nov 10–20, 2026** (201,695 positions, $478k staked): players got back
**102% ± 2%**; the vault lost about $10,400 over those ten days.

| Multiplier | Positions | Quoted win chance | Actual win rate |
|---|---|---|---|
| 1–1.5x | 3,737 | 76.5% | 65.2% |
| 1.5–2x | 22,406 | 55.5% | 53.2% |
| 2–3x | 55,293 | 41.3% | 39.5% |
| 3–5x | 47,103 | 26.8% | 27.1% |
| 5–10x | 33,976 | 15.3% | 15.8% |
| 10–20x | 16,907 | 7.5% | 7.6% |
| 20–50x | 11,915 | 3.5% | 3.5% |
| 50–100x | 10,358 | 1.2% | 1.0% |

The two markets put the margin in opposite places. On real assets the safest tiles are fair and
the margin grows with the multiplier. On the house-generated market the margin sits under 3x and
at the 100x cap, and 3x to 50x is fair or slightly generous. These are tiles players chose, so
selection can flatter some ranges.

## Risk limits

The app enforces per-user caps (max trade, max stake per tile, max payout per tile, per column
and per user). Their values come from the server after login and were not read. The trade
request sends the tapped multiplier and a slippage setting (default 60, units unknown); the
server replies with an executed multiplier that can differ.
