"""Simulate what an operator key and the owner Safe can do, with eth_call (no transactions).

Takes a live position and one just about to be settled, and calls the operator-only functions
from a real operator address and from an outsider. Plain Python, public RPC.

    python3 simulate_operator.py
"""
from lib import *

SAFE = "0xead99759c343b61cf1f27bc0cacfe72239fca81b"
OUTSIDER = "0x000000000000000000000000000000000000dEaD"
W = lambda n: hex(n)[2:].rjust(64, "0")


def call(frm, data, block="latest"):
    try:
        return "ok " + rpc("eth_call", [{"from": frm, "to": EX, "data": data}, block], retry=2)[:66]
    except Exception as e:
        m = str(e)
        i = m.find("'data': '")
        return "revert " + (m[i + 9:i + 19] if i >= 0 else m[:80])


ops = rpc("eth_call", [{"to": EX, "data": "0x88dd2204"}, "latest"])[2:]
op = "0x" + ops[128 + 24:192]
head = int(rpc("eth_blockNumber", []), 16)

# A live position: still in getPositionDetails.
live = None
for l in reversed(rpc("eth_getLogs", [{"address": EX, "fromBlock": hex(head - 30), "toBlock": hex(head), "topics": [[T_OPEN]]}])):
    p = l["topics"][1][2:42].ljust(64, "0")
    if call(op, "0xc8e5f200" + p).startswith("ok"):
        live = p
        break
print("operator key", op)
if live:
    print("live position 0x" + live[:40])
    print("  operator settle, before expiry  ", call(op, "0x73b13318" + live + W(100) + W(200)), "(0x13ef42aa PositionNotExpired)")
    print("  cancel from operator            ", call(op, "0xab73418a" + live))
    print("  cancel from outsider            ", call(OUTSIDER, "0xab73418a" + live), "(0x17cb2fd6 not an operator)")

# A position one block before its settlement transaction: the window is over, not yet settled.
for l in rpc("eth_getLogs", [{"address": EX, "fromBlock": hex(head - 40), "toBlock": hex(head - 5), "topics": [[T_SETTLE]]}])[:20]:
    b = int(l["blockNumber"], 16) - 1
    p = l["topics"][1][2:42].ljust(64, "0")
    if call(op, "0xc8e5f200" + p, hex(b)).startswith("ok"):
        print(f"expired position 0x{p[:40]} at block {b}")
        print("  operator settle, low=1, high=2  ", call(op, "0x73b13318" + p + W(1) + W(2), hex(b)))
        print("  operator settle, low > high     ", call(op, "0x73b13318" + p + W(2) + W(1), hex(b)), "(0xa0f5ba6a InvalidOracleRange)")
        break

print("owner Safe")
print("  addOperator(0xbeef)             ", call(SAFE, "0xff4ca80e" + W(0xBEEF)))
print("  addOperator from an operator    ", call(op, "0xff4ca80e" + W(0xBEEF)), "(0x118cdaa7 OwnableUnauthorizedAccount)")
print("  removeOperator(operator)        ", call(SAFE, "0x594936c3" + op[2:].rjust(64, "0")))
