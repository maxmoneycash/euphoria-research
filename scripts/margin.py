# House margin by multiplier from settled positions: quoted win chance (stake / pot) against the
# actual win rate, and the share of stakes returned to players.
#   python3 scripts/margin.py release/settled_real_oct21-31.csv.gz
import csv,gzip,collections,math,sys
R=[[int(r['open_block']),int(r['settle_block']),r['taker'],float(r['taker_amount_usdm']),float(r['house_amount_usdm']),int(r['taker_won'])]
   for r in csv.DictReader(gzip.open(sys.argv[1],'rt'))]
R=[r for r in R if r[3]>0]
def stats(rows,label):
    n=len(rows); st=sum(r[3] for r in rows); pay=sum((r[3]+r[4]) for r in rows if r[5])
    # variance of per-$ return for SE (stake-weighted)
    imp=sum(r[3]*r[3]/(r[3]+r[4]) for r in rows)   # stake-weighted implied p * stake
    var=sum((r[3]**2)*((r[3]+r[4])/r[3]-1) for r in rows)  # approx var of payout under fair odds
    se=math.sqrt(var)/st if st else 0
    print('%-34s n=%7d staked %10.0f  returned %.4f of stakes (±%.4f)  win rate %.3f vs implied %.3f'%(label,n,st,pay/st,se,sum(r[5] for r in rows)/n,sum(r[3]/(r[3]+r[4]) for r in rows)/n))
print('blocks',R[0][0],'->',R[-1][1],' takers',len({r[2] for r in R}))
stats(R,'ALL')
print('\nby multiplier bucket:')
for lo,hi in ((1,1.5),(1.5,2),(2,3),(3,5),(5,10),(10,20),(20,50),(50,101)):
    s=[r for r in R if lo<=(r[3]+r[4])/r[3]<hi]
    if s: stats(s,'mult %g-%g'%(lo,hi))
print('\nby stake size:')
for lo,hi in ((0,0.2),(0.2,1),(1,5),(5,25),(25,1e9)):
    s=[r for r in R if lo<=r[3]<hi]
    if s: stats(s,'stake %g-%g'%(lo,hi))
bt=collections.defaultdict(list)
for r in R: bt[r[2]].append(r)
top=sorted(bt.items(),key=lambda kv:-sum(r[3] for r in kv[1]))
print('\ntop takers by volume:')
for k,v in top[:12]: stats(v,k[:10])
rest=[r for k,v in top[12:] for r in v]
if rest: stats(rest,'all other takers (%d)'%(len(top)-12))
big=set(k for k,v in top[:3]); stats([r for r in R if r[2] not in big],'excluding top-3 takers')
ms=sorted((r[3]+r[4])/r[3] for r in R); print('\nmultiplier min %.2f  1%% %.2f  median %.2f  99%% %.2f  max %.2f'%(ms[0],ms[len(ms)//100],ms[len(ms)//2],ms[-len(ms)//100],ms[-1]))
print('vault net over sample: %.0f USDm'%(sum(r[3] for r in R if not r[5])-sum(r[4] for r in R if r[5])))
