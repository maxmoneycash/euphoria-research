"""Check recovered function and error names against Euphoria's deployed bytecode.

A function's selector is the first 4 bytes of keccak256 of its signature, so a guessed name that
hashes to a selector in the bytecode is almost certainly the real one. This lists the selectors
in the Exchange and Vault dispatchers and checks the names found by search.

    uv run --with pycryptodome python check_names.py      # or: pip install pycryptodome
"""
import re
import sys
from pathlib import Path

from Crypto.Hash import keccak

ROOT = Path(__file__).resolve().parent.parent / "contracts" / "bytecode"

# Found by searching combinations of words against the unresolved selectors; none are in the
# public signature databases.
RECOVERED = {
    "exchange": [
        "settlePosition(bytes20,bytes32,bytes32)",
        "getPositionDetails(bytes20)",
        "ownerOfPosition(bytes20)",
        "getUnderlyingInfo(uint8)",
        "getDataFeedIds(uint8)",
        "getOracleSignerSet(uint8)",
    ],
    "vault": [
        "transferLeader(address)",
        "acceptLeader()",
        "pendingLeader()",
        "openDepositsEnabled()",
        "enableOpenDeposits()",
        "disableOpenDeposits()",
    ],
}
ERRORS = [  # all seen as revert data from eth_call except DataFeedIdMismatch and NotPendingLeader,
            # which are reverts in the decompiled code
    "PositionNotFound()", "PositionDoesNotExist()", "PositionNotExpired()", "InvalidOracleRange()",
    "UnsupportedUnderlying(uint8)", "DataFeedIdMismatch(bytes32,bytes32)", "NotPendingLeader(address)",
    "NotExchange(address)", "SignerNotAuthorised(address)", "TimestampIsTooOld(uint256,uint256)",
]


def sel(sig):
    h = keccak.new(digest_bits=256)
    h.update(sig.encode())
    return h.hexdigest()[:8]


def dispatcher_selectors(code):
    # Solidity's dispatcher compares the selector with PUSH4 <sel> EQ (0x63 .. 0x14).
    return set(re.findall(r"63([0-9a-f]{8})14", code))


ok = True
for name, fname in [("exchange", "exchange-2ffc6754.hex"), ("vault", "vault-4225d1ab.hex")]:
    code = (ROOT / fname).read_text().strip().removeprefix("0x")
    deployed = dispatcher_selectors(code)
    print(f"{name}: {len(deployed)} selectors in the dispatcher")
    for sig in RECOVERED[name]:
        hit = sel(sig) in deployed
        ok &= hit
        print(f"  {'match' if hit else 'MISSING'}  0x{sel(sig)}  {sig}")
print("errors:")
for sig in ERRORS:
    print(f"  0x{sel(sig)}  {sig}")
sys.exit(0 if ok else 1)
