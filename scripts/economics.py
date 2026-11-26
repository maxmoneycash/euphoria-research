# All-time Euphoria totals from the released event CSVs: trades, unique wallets, volume, payouts,
# wallet concentration, and house revenue by month (from vault balance samples, net of deposits).
#   python3 scripts/economics.py [release dir] [data dir]
import csv, gzip, sys, json, datetime, collections
REL = sys.argv[1] if len(sys.argv) > 1 else "release"
DATA = sys.argv[2] if len(sys.argv) > 2 else "data"
VAULT = "0xdf8248fee58e791149e69f6c61129d471eafc11e"
OFF = 1762797011                      # MegaETH block ~= unix seconds - OFF (one block per second)
month = lambda b: datetime.datetime.fromtimestamp(int(b) + OFF, datetime.timezone.utc).strftime("%Y-%m")
rows = lambda name: csv.DictReader(gzip.open(f"{REL}/euphoria_{name}.csv.gz", "rt"))

trades = collections.Counter()
for r in rows("opens"): trades[month(r["block"])] += 1

n_bets = collections.Counter(); vol = collections.Counter(); m_vol = collections.Counter()
m_users = collections.defaultdict(set); first = {}; house_stakes = 0.0
for r in rows("stakes"):
    a, b, amt = r["from"], int(r["block"]), float(r["amount_usdm"])
    if a == VAULT: house_stakes += amt; continue
    m = month(b); n_bets[a] += 1; vol[a] += amt; m_vol[m] += amt; m_users[m].add(a); first.setdefault(a, b)

paid = 0.0; won = collections.Counter()
for r in rows("settles"):
    w = "house" if r["winner"] == VAULT else "player"; won[w] += 1
    if w == "player": paid += float(r["pot_usdm"])

staked = sum(vol.values())
print(f"trades {sum(trades.values()):,}   unique wallets {len(vol):,}")
print(f"players staked ${staked:,.0f}   paid to winners ${paid:,.0f}   house stakes ${house_stakes:,.0f}")
print(f"settled: house won {won['house']:,}, player won {won['player']:,}")
print(f"house result from settled bets ${staked - paid:,.0f} ({(staked - paid) / staked:.2%} of volume)")
top = [v for _, v in vol.most_common()]
for k in (1, 10, 100): print(f"top {k} wallets: {sum(top[:k]) / staked:.0%} of volume")
nb = sorted(n_bets.values()); vv = sorted(vol.values())
print(f"median wallet: {nb[len(nb) // 2]} trades, ${vv[len(vv) // 2]:,.0f} staked")

# Vault balance sampled every 2,000 blocks; the only outside money is the owner Safe's two deposits.
vb, va = json.load(open(f"{DATA}/vault_assets.json"))
deposits = {12218852: 10000, 15973892: 25000}
def profit_at(block):
    i = max(j for j in range(len(vb)) if vb[j] <= block)
    return va[i] - sum(v for k, v in deposits.items() if k <= block)
def first_block(y, mo): return int(datetime.datetime(y, mo, 1, tzinfo=datetime.timezone.utc).timestamp()) - OFF
new = collections.Counter(month(b) for b in first.values())
print(f"\nvault profit to block {vb[-1]}: ${profit_at(vb[-1]):,.0f}")
print("month     trades     volume$  active   new  house revenue$")
for m in sorted(set(trades) | set(m_vol)):
    y, mo = map(int, m.split("-")); s0, s1 = first_block(y, mo), first_block(y + (mo == 12), mo % 12 + 1)
    rev = profit_at(min(s1, vb[-1])) - profit_at(max(s0, vb[0]))
    print(f"{m} {trades[m]:10,} {m_vol[m]:11,.0f} {len(m_users[m]):7} {new[m]:5} {rev:14,.0f}")
