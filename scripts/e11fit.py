import json,sys,collections,numpy as np
from scipy.optimize import least_squares
def prep(pos,pint=0.25,und=4):
    F=[r for r in pos if r['und']==und]
    ts=np.array([r['ts'] for r in F]); lo=np.array([r['sp'] for r in F])/pint; lead=np.array([r['start']-r['ts'] for r in F],float)
    lp=np.log(np.array([r['ta']/(r['ta']+r['ma']) for r in F])); ok=(lead>=3)&(lead<=90)&(lp>np.log(0.0101))
    return ts[ok],lo[ok],lead[ok],lp[ok]
def predict(x,S,lo,lead):
    k,beta,a0,a1,h0,h1,hc=x
    d=np.where(lo>S,lo-S,np.where(lo+1<S,S-(lo+1),0.0)); L=np.log(lead)
    lam=k*lead**beta; out=a0+a1*L-d/lam
    pos_in=np.clip(S-lo,0,1); home=h0+h1*L+hc*(-np.abs(pos_in-0.5)*2)   # higher when price mid-tile
    return np.where(d>0,np.minimum(out,home),home)
def fit(ts,lo,lead,lp,iters=8,minfill=3,holdout=False,seed=0):
    secs,inv,cnt=np.unique(ts,return_inverse=True,return_counts=True)
    use=cnt[inv]>=minfill; ts,lo,lead,lp=ts[use],lo[use],lead[use],lp[use]; secs,inv,cnt=np.unique(ts,return_inverse=True,return_counts=True)
    rng=np.random.default_rng(seed); hold=np.zeros(len(ts),bool)
    if holdout:
        for k in range(len(secs)):
            idx=np.where(inv==k)[0]
            if len(idx)>=minfill+1: hold[rng.choice(idx)]=True
    S=np.array([lo[inv==k][np.argmax(lp[inv==k])]+0.5 for k in range(len(secs))])
    x=np.array([2.0,0.1,-0.3,-0.2,-0.2,-0.3,0.2])
    tr=~hold
    for it in range(iters):
        r=least_squares(lambda x:predict(x,S[inv[tr]],lo[tr],lead[tr])-lp[tr],x,loss='soft_l1',f_scale=0.1,bounds=([0.2,-0.5,-3,-2,-3,-2,0],[20,1.5,1,1,1,1,2])); x=r.x
        for k in range(len(secs)):
            idx=np.where((inv==k)&tr)[0]; c=np.arange(lo[idx].min()-4,lo[idx].max()+5,0.05)
            e=[np.abs(predict(x,ci,lo[idx],lead[idx])-lp[idx]).sum() for ci in c]; S[k]=c[int(np.argmin(e))]
    res=predict(x,S[inv],lo,lead)-lp
    return x,S,res,hold,dict(n=len(ts),secs=len(secs))
def report(x,res,hold,info,label):
    k,beta,a0,a1,h0,h1,hc=x
    print('%s: fills %d in %d seconds'%(label,info['n'],info['secs']))
    print('  tiles the price is NOT inside:  p = %.3f * lead^%.2f * exp(-d / lambda),   lambda = %.2f * lead^%.2f tiles   (d = tiles from price to near edge, lead in s)'%(np.exp(a0),a1,k,beta))
    print('  tile the price IS inside:       p = %.3f * lead^%.2f * exp(-%.2f*|2*pos-1|)   (pos = where price sits in tile, 0..1)'%(np.exp(h0),h1,hc))
    tr=~hold; print('  in-sample: median abs error %.1f%%, 90th pct %.1f%%'%(100*np.median(np.abs(res[tr])),100*np.quantile(np.abs(res[tr]),.9)))
    if hold.any(): print('  HELD-OUT fills (%d, not used to locate the price): median abs error %.1f%%, 75th %.1f%%, 90th %.1f%%'%(hold.sum(),100*np.median(np.abs(res[hold])),100*np.quantile(np.abs(res[hold]),.75),100*np.quantile(np.abs(res[hold]),.9)))
if __name__=="__main__":
    D=json.load(open(sys.argv[1])); ts,lo,lead,lp=prep(D['pos'] if isinstance(D,dict) else D)
    x,S,res,hold,info=fit(ts,lo,lead,lp,holdout=True); report(x,res,hold,info,sys.argv[1]); np.save('e11_law.npy',x)
    print('  example multipliers from the law (price mid-tile):'); 
    print('   lead   home   +1 tile  +2     +3     +4     +6     +8   (tiles from price to tile near edge: 0.5,1.5,...)')
    for L in (6,10,15,20,30,45):
        print('   %3ds  %5.2f  '%(L,np.exp(-predict(x,np.array([0.5]),np.array([0.0]),np.array([float(L)]))[0]))+'  '.join('%5.2f'%min(100,np.exp(-predict(x,np.array([0.5]),np.array([float(j)]),np.array([float(L)]))[0])) for j in (1,2,3,4,6,8)))
