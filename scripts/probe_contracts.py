"""Read Euphoria's Exchange and Vault through their view functions.

Reproduces the eth_call probes behind contracts/README.md: market config, operator set,
signer checks, constants, and one live position. Plain Python, public RPC.

    python3 probe_contracts.py
"""
from lib import *

W = lambda x: x.rjust(64, "0")
B20 = lambda x: x.ljust(64, "0")


def call(to, data):
    try:
        return rpc("eth_call", [{"to": to, "data": data}, "latest"], retry=2)
    except Exception as e:
        msg = str(e)
        i = msg.find("'data': '")
        return "revert " + (msg[i + 9:i + 19] if i >= 0 else msg[:80])


def words(r):
    return [r[2 + i * 64:2 + (i + 1) * 64] for i in range((len(r) - 2) // 64)] if r.startswith("0x") else [r]


def text(w):
    return bytes.fromhex(w).rstrip(b"\0").decode(errors="replace")


print("Exchange constants")
for name, sel in [("operatorCount", "07c107a7"), ("TEST_UNDERLYING_START (240)", "20b0a709"),
                  ("owner", "8da5cb5b"), ("feeCollector", "c415b95c"), ("feeBasisPoints", "b8606eef"),
                  ("isTestnet", "92108c86"), ("paused", "5c975abb"), ("collateralToken", "b2016bd4"),
                  ("getUniqueSignersThreshold", "f90c4924"), ("TAKER_ORDER_TYPEHASH", "8b0eebae")]:
    print(f"  {name:30s}", words(call(EX, "0x" + sel))[0])

print("Underlyings (getUnderlyingInfo, getUnderlyingFeedIds, oracle type, isTest)")
for u in range(0, 8):
    info = words(call(EX, "0xa644f434" + W(hex(u)[2:])))
    if len(info) < 7:
        print(f"  {u}: {info[0]}")
        continue
    kind = int(info[4], 16)
    print(f"  {u}: {text(info[6]):4s} low={text(info[2])} high={text(info[3])} "
          f"oracle={kind} ({'RedStone Bolt' if kind == 0 else 'Euphoria signer'}) "
          f"548599cd={int(words(call(EX, '0x548599cd' + W(hex(u)[2:])))[0], 16)}")

ops = words(call(EX, "0x88dd2204"))
print(f"Operators: {int(ops[1], 16)} listed; first {['0x' + w[24:] for w in ops[2:5]]}")
print("  isOperator(first) =", int(words(call(EX, "0x6002095b" + ops[2]))[0], 16))
print("  getAuthorisedSignerIndex(first operator) ->", call(EX, "0x3ce142f5" + ops[2]),
      "(ec459bc0 = SignerNotAuthorised: operators cannot sign prices)")

head = int(rpc("eth_blockNumber", []), 16)
logs = rpc("eth_getLogs", [{"address": EX, "fromBlock": hex(head - 30), "toBlock": hex(head), "topics": [[T_OPEN]]}])
pid = None
for l in reversed(logs):  # newest first; a position disappears once settled
    if words(call(EX, "0xc8e5f200" + B20(l["topics"][1][2:42])))[0][:6] != "revert":
        pid = l["topics"][1][2:42]
        break
if pid:
    names = ["startPrice", "priceInterval", "startTime", "timeInterval", "underlying", "nonce",
             "taker", "maker", "takerAmount", "makerAmount"]
    det = words(call(EX, "0xc8e5f200" + B20(pid)))
    print(f"getPositionDetails(0x{pid}):")
    for n, w in zip(names, det):
        print(f"  {n:14s} {int(w, 16) if n not in ('taker', 'maker') else '0x' + w[24:]}")
    print("  ownerOfPosition ->", "0x" + words(call(EX, "0x96d18078" + B20(pid)))[0][24:])
else:
    print("No position opened in the last few blocks; run again.")

print("Vault")
for name, sel in [("totalAssets", "01e1d114"), ("lockedAssets", "274fc72a"), ("availableAssets", "20124bce"),
                  ("leader", "40eedabb"), ("pendingLeader", "340fea41"), ("openDepositsEnabled", "d4329775"),
                  ("exchange", "d2f7265a")]:
    r = words(call(VA, "0x" + sel))[0]
    v = r if not r.startswith("0" * 20) or "Assets" not in name else f"{int(r, 16) / 1e18:,.2f} USDm"
    print(f"  {name:20s}", v)
