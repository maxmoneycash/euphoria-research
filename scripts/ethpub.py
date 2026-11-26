import json,numpy as np
from scipy.optimize import least_squares
from ethchain import touch
T=0.5
def load():
    d=[r for r in json.load(open('positions_real_oct.json')) if r['und']==1 and r['feeds']]
    K=np.load('binance_eth_1s.npy'); t=K[:,0].astype(int); c=K[:,4]; idx={int(x):i for i,x in enumerate(t)}
    win={}
    for r in d:
        f=dict((x[0].split('_')[1],x[1]) for x in r['feeds']); win[r['start']]=(f['LOW'],f['HIGH'])
    # slow basis: feed mid minus binance mid per window, rolling median over ~2 min
    ws=np.array(sorted(win)); b=np.array([(win[s][0]+win[s][1])/2-(K[[idx[x] for x in range(s,s+5)],3].min()+K[[idx[x] for x in range(s,s+5)],2].max())/2 for s in ws])
    bs=np.array([np.median(b[max(0,i-12):i+13]) for i in range(len(b))]); basis=np.interp(t,ws,bs)
    px=(c+basis)/T                                   # feed-equivalent price in tiles, per second
    ret=np.diff(px,prepend=px[0])
    F=[]
    for r in d:
        p=r['takerAmt']/(r['takerAmt']+r['makerAmt']); lead=r['start']-r['openTs']
        if p<=0.0101 or lead<3 or lead>95 or r['openTs']-10 not in idx: continue
        F.append((idx[r['openTs']],r['sp']/T,lead,np.log(p),int(r['settleTopic2'][-40:]==r['taker'][2:]),r['takerAmt']))
    return px,ret,np.array(F)
def ewma_vol(ret,h):
    a=1-0.5**(1/h); v=np.zeros(len(ret)); s=ret[:60].var()
    for i,r in enumerate(ret): s=(1-a)*s+a*r*r; v[i]=s
    return np.sqrt(v)
if __name__=="__main__":
    px,ret,F=load(); i0=F[:,0].astype(int); lo=F[:,1]; lead=F[:,2]; lp=F[:,3]
    rng=np.random.default_rng(2); hold=rng.random(len(F))<0.25; tr=~hold
    print('fills',len(F),'| 1s move sd %.3f tiles'%ret.std())
    best=None
    for lag in (0,1,2,3,4,6):
        S=px[i0-lag]
        for h in (5,15,45,120,400,1500):
            vol=ewma_vol(ret,h)[i0-lag]
            def mB(x): return np.log(np.clip(x[0]*touch(S,lo,lead+lag+x[3],np.sqrt((x[1]*vol)**2+x[2]**2)),1e-6,1))
            r=least_squares(lambda x:(mB(x)-lp)[tr],[1,1,0.1,0],loss='soft_l1',f_scale=0.1,bounds=([0.5,0,0,-2],[1.5,5,1,6]),diff_step=1e-3,max_nfev=25)
            e=mB(r.x)-lp; s=np.median(np.abs(e[hold]))
            print('lag %d h %4ds  M %.2f a %.2f floor %.3f extra %.1f | held-out median %.1f%% 90th %.1f%%'%(lag,h,*r.x,100*s,100*np.quantile(np.abs(e[hold]),.9)),flush=True)
            if best is None or s<best[0]: best=(s,lag,h,r.x)
    print('BEST random-walk model:',best)
    np.save('ethpub_best.npy',np.r_[best[1],best[2],best[3]])
