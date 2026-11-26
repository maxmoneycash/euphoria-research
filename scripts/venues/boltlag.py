import numpy as np, pandas as pd
d=pd.read_csv('trades.csv'); d=d[(d.price>0)&((d.recv_ms-d.exch_ms).abs()<5000)]
b=np.load('bolt_btc.npy'); b=b[np.argsort(b[:,0],kind='stable')]
t0=max(d.groupby('venue').exch_ms.min().max(), b[0,0]*1000)+2000; t1=min(d.groupby('venue').exch_ms.max().min(), b[-1,0]*1000)-2000
STEP=100; g=np.arange(t0,t1,STEP)
def series(t,p):
    i=np.searchsorted(t,g,side='right')-1; return np.log(p[i])
bolt=series(b[:,0]*1000,b[:,1])
print('bolt ticks',len(b),'over',round((b[-1,0]-b[0,0])/60,1),'min; median gap ms',np.median(np.diff(b[:,0]))*1000)
venues={v:series(x.exch_ms.values,x.price.values) for v,x in d.sort_values('exch_ms',kind='stable').groupby('venue')}
print('\nHow much of a venue move shows up in Bolt after k seconds (regression of future Bolt move on the venue-Bolt gap):')
print('venue          ' + '  '.join(f'{k:>5}s' for k in [0.1,0.3,0.5,1,2,5]))
for v,x in venues.items():
    gap=x-bolt; gap=gap-pd.Series(gap).rolling(600,min_periods=50).mean().bfill().values
    row=[]
    for k in [0.1,0.3,0.5,1,2,5]:
        h=int(k*1000/STEP); f=bolt[h:]-bolt[:-h]; gg=gap[:-h]
        row.append(np.polyfit(gg,f,1)[0])
    print(f'{v:14s} '+'  '.join(f'{r:6.2f}' for r in row))
H=1; rb=np.diff(bolt)
print('\npeak lag of Bolt behind each venue (100 ms returns):')
for v,x in venues.items():
    rv=np.diff(x); best=max(range(0,40),key=lambda L:np.corrcoef(rv[:len(rv)-L],rb[L:])[0,1])
    print(f'{v:14s} {best*STEP:5d} ms  corr {np.corrcoef(rv[:len(rv)-best],rb[best:])[0,1]:.2f}')
