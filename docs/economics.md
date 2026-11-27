# Revenue, users and costs

Every Exchange event from launch (block 12,200,000, Apr 1, 2026) to block 32,549,999 (Nov 21,
2026), with no gaps. Reproduce with `python3 scripts/economics.py`.

| All time | |
|---|---|
| Trades | 5,093,088 |
| Unique wallets | 3,597 |
| Staked by players | $6.71M |
| Paid to winners | $6.54M |
| House result | **$164,400**, 2.45% of volume |

Cross-check: the vault's balance growth net of its two deposits is $158,000 at block 32,416,000
(the last balance sample) and about $160,500 on Nov 21. The two methods agree within a few
thousand dollars.

## By month

| Month | Trades | Volume | Active wallets | New wallets | House revenue |
|---|---|---|---|---|---|
| Apr | 71k | $157k | 72 | 72 | −$700 |
| May | 901k | $1.78M | 1,865 | 1,813 | $88,600 |
| Jun | 724k | $440k | 575 | 267 | $24,500 |
| Jul | 439k | $306k | 702 | 486 | −$5,100 |
| Aug | 646k | $728k | 578 | 388 | $7,600 |
| Sep | 1.11M | $1.52M | 485 | 318 | $20,600 |
| Oct | 833k | $851k | 371 | 191 | $17,500 |
| Nov (to the 21st) | 365k | $925k | 186 | 62 | $4,900 |

More than half of all revenue came in May, the launch month. Active wallets have fallen since,
while stakes per trade have grown.

## Concentration

Wallets are not people, and many trade like bots: the median wallet made 111 trades but staked
$71 in total. The largest wallet is 24% of all volume, the top 10 are 58% and the top 100 are 80%.

The largest account (`0xed435fd9…cd76`) placed about 77% of volume in Nov 10–20, mostly $50 bets
on two adjacent tiles per column, 10 to 30 s ahead, at 3x to 6x, the range where the
house-generated market carries no margin. Its ten-day result was +$9,858 on $368k staked
(+2.7% ± 2.4%), not distinguishable from break-even.

## After the data release

From block 32,550,000 (Nov 21) to 32,956,639 (Nov 26), outside the released data, the vault lost
**$20,861** (USDm transfers between the Exchange and the vault; nothing was withdrawn). It held
$174,700 on Nov 26.

Most of it went to the same largest account. It staked $236,833 over 5,027 bets and came out
$32,375 ahead, 13.7% of its stake; the next best wallet made $1,282. It won 1,524 of its 5,027
bets. In a random sample of 600 of them, 534 were on "Steady" (E11), where it won 33.7% against the
28.6% its multipliers imply (about 2.6 standard errors), with most fills 10 to 24 s before the
window starts.
The house quotes that market from a price about 4 s old with no margin
([pricing](pricing.md)), which would leave room for this, but the data here does not show how it
was done.

## How it stays solvent

- **The bankroll is the house's own money.** $35,000 came in from the owner Safe; the rest is
  accumulated player losses. No outside depositors are exposed.
- **Small exposure.** Open bets were around $650 to $800 against a vault of about $195,000
  (Nov 21).
- **A margin**, at least on real assets (players got back 96% in late October).
- **Operator control**: odds are chosen off-chain, positions can be cancelled, contracts can be
  upgraded.

Nothing on-chain guarantees solvency. A bad run or a pricing error comes out of the vault.

## What it costs to run

Measured on-chain:

- **Gas:** about 2.1 ETH in total over 6.3 million transactions (1.94e12 gas at about 0.0011
  gwei), roughly $3,600 at $1,680 per ETH; about $0.0006 per trade.
- **Oracle updates:** paid by RedStone's own keys, not Euphoria.
- **Protocol fees:** none (fee set to zero).

Not visible on-chain: hosting (the API sits behind a Google Cloud load balancer, the website on
Firebase Hosting), any commercial terms with RedStone, and the team. Even a small engineering
team would likely cost more than the $5,000 to $20,000 a month the vault has earned since June,
so the business is probably funded by something other than trading profit.
