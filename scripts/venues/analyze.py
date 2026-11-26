import numpy as np, pandas as pd, sys
d=pd.read_csv('trades.csv'); d=d[(d.price>0)&((d.recv_ms-d.exch_ms).abs()<5000)]
bolt=None
try:
    b=np.load('bolt_btc.npy'); bolt=pd.DataFrame({'venue':'bolt_onchain','exch_ms':b[:,0]*1000,'recv_ms':np.nan,'price':b[:,1],'qty':0})
    d=pd.concat([d,bolt])
except FileNotFoundError: pass
t0=d[d.venue!='bolt_onchain'].groupby('venue').exch_ms.min().max(); t1=d[d.venue!='bolt_onchain'].groupby('venue').exch_ms.max().min()
print(f"{(t1-t0)/60000:.1f} minutes")
print("\nvenue          trades  trades/s  median arrival delay ms (local clock)")
for v,g in d.groupby('venue'):
    dl=(g.recv_ms-g.exch_ms).median()
    print(f"{v:14s} {len(g):7d} {len(g)/((t1-t0)/1000):8.1f}  {dl:8.0f}" if not np.isnan(dl) else f"{v:14s} {len(g):7d} {len(g)/((t1-t0)/1000):8.1f}       n/a")
STEP=10  # ms grid
grid=np.arange(t0+5000,t1-5000,STEP)
P={}
for v,g in d.groupby('venue'):
    g=g.sort_values('exch_ms',kind='stable')
    i=np.searchsorted(g.exch_ms.values,grid,side='right')-1
    if (i<0).any(): continue
    P[v]=np.log(g.price.values[i])
ref='binance_perp'
def xcorr(a,b,maxlag):  # corr of returns a(t) vs b(t+lag) over 100ms horizons
    H=10  # 100 ms returns
    ra=a[H:]-a[:-H]; rb=b[H:]-b[:-H]; out=[]
    for L in range(-maxlag,maxlag+1):
        if L>=0: x,y=ra[:len(ra)-L],rb[L:]
        else: x,y=ra[-L:],rb[:len(rb)+L]
        out.append(np.corrcoef(x,y)[0,1])
    return np.array(out)
print(f"\nLead vs {ref} (100 ms returns). Positive lag = venue moves AFTER {ref}.")
print("venue          peak lag ms  peak corr   corr at 0")
ML=100  # 1 s in 10 ms steps
for v in sorted(P):
    if v==ref: continue
    c=xcorr(P[ref],P[v],ML); k=np.nanargmax(c)
    print(f"{v:14s} {(k-ML)*STEP:11d} {c[k]:10.3f} {c[ML]:10.3f}")
# big-move race: 1-second moves of >= 8 bps on the median venue; when does each venue cover half the move
mid=np.median(np.vstack([P[v] for v in P if v!='bolt_onchain']),axis=0)
W=100  # 1 s
mv=mid[W:]-mid[:-W]; idx=np.where(np.abs(mv)>=8e-4)[0]
ev=[];last=-10**9
for i in idx:
    if i-last>300: ev.append(i); last=i
print(f"\nBig moves (>=8 bps in 1 s): {len(ev)}. Time each venue first covers half the move, relative to the median venue (ms; negative = earlier).")
rows={v:[] for v in P}
for i in ev:
    s=i; e=i+W; target=mid[s]+(mid[e]-mid[s])/2; sign=np.sign(mid[e]-mid[s])
    def first(x):
        base=x[s-50:s].mean() if s>=50 else x[s]
        # venue-specific basis: compare moves, not levels
        y=x[s-50:e+300]-base+mid[s]
        hit=np.where(sign*(y-target)>=0)[0]
        hit=hit[hit>=50]
        return (hit[0]-50)*STEP if len(hit) else np.nan
    tm=first(mid)
    for v in P: rows[v].append(first(P[v])-tm)
print("venue          median    25%     75%   moves reached")
for v in sorted(rows,key=lambda v:np.nanmedian(rows[v]) if np.isfinite(rows[v]).any() else 9e9):
    r=np.array(rows[v],float)
    if np.isfinite(r).any(): print(f"{v:14s} {np.nanmedian(r):7.0f} {np.nanpercentile(r,25):7.0f} {np.nanpercentile(r,75):7.0f}   {np.isfinite(r).sum()}/{len(r)}")
