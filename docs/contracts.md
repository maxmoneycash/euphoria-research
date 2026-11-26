# Contracts and trust model

Everything here was read from MegaETH mainnet (chain id 4326). Euphoria's contracts are not
verified on the block explorer, so function names come from decompiling the bytecode and from
watching what each call does in real transactions.

## Addresses

| Contract | Proxy | Implementation (Nov 2026) |
|---|---|---|
| Exchange | `0x12759afcA690637b425ffbA3265F0Dc2F6242A8D` | `0x2ffc67547c57d1b1d6aea74508689c36dcc7bc1a` (Nov 20, 2026) |
| Vault ("Euphoria Vault", EV) | `0xdf8248fee58e791149e69f6c61129D471EaFC11E` | `0x4225d1ab3c5efb7895b7167151d978f16c995f7c` |
| USDm (collateral, 18 decimals) | `0xFAfDdbb3FC7688494971a79cc65DCa3EF82079E7` | `0xac37677261885fdb372a37ac8d5d47044196073c` |
| Owner | `0xead99759c343b61cf1f27bc0cacfe72239fca81b` | 2-of-3 Safe multisig |
| RedStone Bolt feed adapter | `0x897A33A0AF45b3ba097Bd6045187D622252e6AcD` | verified as `MegaEthFastMultiFeedAdapterV1` |

The Exchange implementation was replaced on Oct 31 (`0x27CBa3c0…013f`) and again on Nov 20, 2026.
The Nov 20 change only added two house-generated markets ("Snappy" and "Storm"); the function set
is the same. The Vault and USDm implementations have not changed since May.

Event topics used by the scripts (`scripts/lib.py`):

| Event | Topic 0 |
|---|---|
| Position opened (Exchange) | `0x9f039a0ca58d6157d7b6914e2d60cedacf65fea21a365e93d708a5e5c25454f3` |
| Position settled (Exchange) | `0x90cacdb710d0777a8e5fb6387c414be82e2ffe362a703077117a2a995fce12c1` |
| Vault balance change | `0x163aa6d2d8e5248ce93dbd22509af93e5f27f8e0edc15c9e26f2867c593e0870` |
| USDm `Transfer` | `0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef` |

## What a bet is

A tile is a box on the price chart: a price band `[startPrice, startPrice + priceInterval)` over a
time window `[startTime, startTime + timeInterval)`, typically 5 seconds starting 5 to 90 seconds
ahead. It wins if the price touches the band at any moment in the window:

```
taker wins  <=>  windowHigh >= startPrice  and  windowLow < startPrice + priceInterval
```

This rule matched 1,853 of 1,853 positions checked against their settlement prices.

## Lifecycle

1. **Quote.** Euphoria's server streams a grid of multipliers per market (time columns by price
   rows). The multiplier is not stored or checked on-chain.
2. **Order.** The player signs `takerAmount, underlying, nonce, startTime, timeInterval,
   startPrice, priceInterval`. The multiplier is not part of what they sign.
3. **Fill.** One of about 1,000 whitelisted operator keys submits the order and chooses
   `makerAmount`, the house's side of the pot. The Exchange pulls the player's stake and calls
   `Vault.fundPosition(makerAmount)`, so the vault is the counterparty on every bet. All 24,012
   positions sampled across the contract's history had the vault as maker.
4. **Settle.** About a second after the window ends, a settlement transaction carries a signed
   low and high for the window (see [oracle.md](oracle.md)). The winner receives the whole pot.
5. **Fees.** The protocol fee is set to zero. The house earns only through the odds it quotes.

## What the contract enforces, and what it leaves to the operator

| Property | On-chain? |
|---|---|
| Player's stake and tile | Yes, signed by the player |
| Odds (house stake) | No. The operator picks `makerAmount`; a replayed order with it raised 10,000x succeeded in simulation and only fails if the vault cannot cover it |
| Settlement price | Signed low/high checked against a hardcoded signer list; one valid signature is enough |
| Price freshness | A signed price older than 180 s is rejected |
| Operator override settle | Exists (`0x73b13318(positionId, low, high)`): after expiry an operator can settle with prices it supplies |
| Operator cancel | Exists (`0xab73418a`): refunds both sides of a live position |
| Upgrades | The owner Safe can replace the Exchange and Vault logic |

In practice the overrides are rarely used: 33 operator cancels in the contract's whole history
(27 of them in one cluster in late October), and every one of 606 settlements sampled across
eleven points in history used an oracle-signed price rather than an operator-supplied one.

## The vault

- Deposits are whitelisted. The owner Safe is the only shareholder (100% of shares).
- Outside money: two deposits from the Safe, 10,000 USDm (block 12,218,852, Apr 1, 2026) and 25,000 USDm (block 15,973,892, May 14, 2026).
  Sampling the vault balance every 2,000 blocks since launch shows no other step changes, so the
  rest of the balance is trading profit.
- Nothing has ever been withdrawn.
- Open exposure is small relative to the bankroll: around $650 to $800 locked in open positions
  against a vault of about $195,000 when checked in November.
