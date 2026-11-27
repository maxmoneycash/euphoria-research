# Contracts

Euphoria has not published source code for its contracts, and they are not verified on the block
explorer. This folder rebuilds their interfaces from the deployed bytecode and checks each entry
against the chain.

| File | What it is |
|---|---|
| [`IEuphoriaExchange.sol`](IEuphoriaExchange.sol) | Hand-written interface for the Exchange (implementation `0x2ffc6754…`, Nov 20, 2026), plus the functions whose names are unknown as raw selectors (`EuphoriaUnnamed`) |
| [`IEuphoriaVault.sol`](IEuphoriaVault.sol) | Hand-written interface for the Vault (implementation `0x4225d1ab…`, unchanged since May) |
| `heimdall/` | Unedited [heimdall-rs](https://github.com/Jon-Becker/heimdall-rs) output (Solidity-like code and an ABI) for both, kept for reference |
| `bytecode/` | The runtime bytecode both were made from (`eth_getCode`, Nov 26, 2026) |

Both interfaces compile (Solidity 0.8.20+). Every function, event and error in them hashes to a
selector in the deployed bytecode, so the names are very likely Euphoria's own, and the
interfaces can be used to call the contracts. A guessed name would hash to a different selector,
so functions with unknown names are listed only by selector.

## How the names were found

1. **Standard libraries.** OpenZeppelin (ownership, pausing, upgrades, ERC-20, ERC-4626) and
   RedStone's consumer contracts have public signatures that heimdall resolves.
2. **Search.** About a quarter of the functions are Euphoria's own and in no public signature
   database. A search over word combinations found 12 of them, for example
   `settlePosition(bytes20,bytes32,bytes32)` and `getPositionDetails(bytes20)`
   ([`scripts/check_names.py`](../scripts/check_names.py) checks them).
3. **Behaviour.** Every unnamed function was then called with `eth_call`: read functions with
   real ids, and operator and owner functions from a real operator address, the owner Safe and an
   outsider ([`scripts/probe_contracts.py`](../scripts/probe_contracts.py),
   [`scripts/simulate_operator.py`](../scripts/simulate_operator.py)). `eth_call` runs a
   function against the chain's state without sending a transaction.
4. **Transactions.** Argument layouts for opening and settling come from real transactions
   (9,324 opens and 9,324 settlements in the released samples).

## Exchange functions

"Name" says whether the name hashes to the deployed selector (real) or is our label (ours).

| Selector | Name | Name is | What it does | Evidence |
|---|---|---|---|---|
| `0x93ca625d` | open position | ours | Takes the player's signed order, pulls their stake, and takes the house's stake from the Vault | 9,323 of 9,324 sampled opens |
| `0x6f7e758c` | open with permit | ours | Same, after a USDm `permit` for a player with no allowance yet | 1 of 9,324 opens |
| `0x21d5c9bb` | `settlePosition` | real | Settles with a signed low/high appended to the calldata; its two arguments are feed names (`BTC_LOW`, `BTC_HIGH`), not prices | every sampled settlement |
| `0x73b13318` | operator settle | ours | Settles with any low and high the operator chooses, once the window is over | simulated |
| `0xab73418a` | cancel | ours | Refunds both sides of a live position | simulated |
| `0xc8e5f200` | `getPositionDetails` | real | The position's tile, both parties and both stakes | called |
| `0x96d18078` | `ownerOfPosition` | real | The taker | called |
| `0xa644f434` | `getUnderlyingInfo` | real | Symbol, feed names, signer set | called |
| `0x1052bd65` | `getDataFeedIds` | real | Feed names for a market | called |
| `0x548599cd` | `getOracleSignerSet` | real | 0 for ETH, BTC, SOL (Bolt node keys); 2 for E11 to E13 (Euphoria's key) | called |
| `0x6002095b`, `0x88dd2204`, `0x07c107a7`, `0xfeddc85c` | operator checks and lists | ours | Whether an address is an operator, the list of operators, the count (1,000), one by index | called |
| `0xff4ca80e`, `0x594936c3` | add or remove operator | ours | Owner Safe only | simulated |
| `0x8a71c6a0`, `0x20b0a709` | test markets | ours | Market ids 240 and up are test markets; the code also has a branch for chain id 31337, a local test chain | called, code |

The rest are standard: RedStone's signer and timestamp checks, EIP-712 for player orders (domain
"Euphoria", version "1"), fees (0 bps), pausing, ownership and UUPS upgrades.

## What this adds to [docs/contracts.md](../docs/contracts.md)

- **An operator key can decide any expired bet.** Simulated from a real operator address one
  block after a window ended, operator settle accepted a low of $0.00000001 and a high of
  $0.00000002, which makes the player lose. It rejects only low > high. Before expiry it reverts
  `PositionNotExpired`. Operators can also cancel live positions. Outsiders get `0x17cb2fd6`.
  Settlements sampled through history used signed prices (see contracts.md), so this power
  exists but does not show up in use.
- **Operators cannot sign prices.** `getAuthorisedSignerIndex` rejects operator addresses; price
  signers are a separate hardcoded list.
- **The operator keys were replaced once.** 1,000 keys were added at launch (blocks 12,189,043 to
  12,189,397). In May, 1,000 new keys were added (15,392,835 to 15,393,376) and all 1,000 launch
  keys were removed (15,407,818 to 15,408,043). All of it went through the owner Safe.
- **Settlement checks names, not values, in its arguments.** `settlePosition` takes the feed names
  and reverts `DataFeedIdMismatch` if they are not the market's; the prices come only from the
  signed payload.

## Earlier decompile

A May 2026 heimdall decompile of the implementation at the time (`0x95d2a2cb…`) is not included.
Two newer implementations have replaced it, and its labels were guessed from code alone,
without checking against transactions, which mislabelled the open and settle functions.

## Regenerate

```sh
curl -s https://mainnet.megaeth.com/rpc -H 'content-type: application/json' \
  -d '{"jsonrpc":"2.0","id":1,"method":"eth_getCode","params":["0x2ffc67547c57d1b1d6aea74508689c36dcc7bc1a","latest"]}' \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["result"])' > exchange.hex
heimdall decompile "$(cat exchange.hex)" --include-sol --output out   # release 0.9.3; the binary reports 0.9.2
```

SHA-256 of the files in `bytecode/`: Exchange
`650b9167baeb854a67f64ca2aa13c883e9d101af616c8120621350eb6b99dd34`, Vault
`09b6d596dd9a3ce1cf0c8220e1bc48d3fc75fd8cce7462e78c9623e2cf7b82fe`.

heimdall's output is a reading aid, not source: it may not compile, it can invert conditions, and
it types arguments from use, so it shows `settlePosition`'s feed names as `uint256` and the open
order as `(uint256, address, uint64)`. Some names it resolved collide with unrelated signatures
(for example it calls `DOMAIN_SEPARATOR` `fopwCDKKK`). Trust the interfaces above over it.

The bytecode is public chain data, decompiled here for research and interoperability.
