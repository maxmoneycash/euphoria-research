import json,sys,numpy as np
from scipy.stats import norm
from scipy.optimize import least_squares
from e11fit import prep
GX=np.linspace(-6,6,241); GW=norm.pdf(GX); GW/=GW.sum()
def touch(S,lo,t1,sig,tau=5.0):
    """BM touch prob of tile [lo,lo+1) over [t1,t1+tau]; S,lo,t1 broadcastable arrays (tile units, seconds)"""
    S=np.asarray(S,float)[...,None]; lo=np.asarray(lo,float)[...,None]; t1=np.maximum(np.asarray(t1,float),0.05)[...,None]
    x=S+sig*np.sqrt(t1)*GX; st=sig*np.sqrt(tau)
    below=np.where(x<lo,2*norm.cdf((lo-x)/st)-1,0.0); above=np.where(x>lo+1,2*norm.cdf((x-lo-1)/st)-1,0.0)
    return 1-((below+above)*GW).sum(axis=-1)
def model(x,S,lo,lead):
    sig,M,lag=x; return np.log(np.clip(M*touch(S,lo,lead+lag,sig),1e-6,1.0))
def fit(ts,lo,lead,lp,iters=6,minfill=3,holdout=True,seed=0,x0=(0.65,1.0,0.0),fix=None):
    secs,inv,cnt=np.unique(ts,return_inverse=True,return_counts=True); use=cnt[inv]>=minfill
    ts,lo,lead,lp=ts[use],lo[use],lead[use],lp[use]; secs,inv,cnt=np.unique(ts,return_inverse=True,return_counts=True)
    rng=np.random.default_rng(seed); hold=np.zeros(len(ts),bool)
    if holdout:
        for k in range(len(secs)):
            idx=np.where(inv==k)[0]
            if len(idx)>=minfill+1: hold[rng.choice(idx)]=True
    tr=~hold; S=np.array([lo[inv==k][np.argmax(lp[inv==k])]+0.5 for k in range(len(secs))]); x=np.array(x0,float)
    groups=[np.where((inv==k)&tr)[0] for k in range(len(secs))]
    for it in range(iters):
        for k,idx in enumerate(groups):
            c=np.arange(lo[idx].min()-5,lo[idx].max()+6,0.05)
            pr=model(x,c[:,None],lo[idx][None,:],lead[idx][None,:]); S[k]=c[np.abs(pr-lp[idx][None,:]).sum(axis=1).argmin()]
        if fix is None:
            r=least_squares(lambda x:model(x,S[inv[tr]],lo[tr],lead[tr])-lp[tr],x,loss='soft_l1',f_scale=0.1,bounds=([0.1,0.5,-3],[3,1.5,6]),diff_step=1e-3); x=r.x
        res=model(x,S[inv],lo,lead)-lp
        print('  iter %d sigma %.3f tiles/sqrt(s) (%.2f per 5s)  M %.3f  lag %.2fs | train med %.1f%%  held-out med %.1f%% 90th %.1f%%'%(it,x[0],x[0]*5**.5,x[1],x[2],100*np.median(np.abs(res[tr])),100*np.median(np.abs(res[hold])) if hold.any() else 0,100*np.quantile(np.abs(res[hold]),.9) if hold.any() else 0),flush=True)
    return x,S,inv,res,hold,(ts,lo,lead,lp)
if __name__=="__main__":
    D=json.load(open(sys.argv[1])); ts,lo,lead,lp=prep(D['pos'] if isinstance(D,dict) else D)
    print('model: quoted p = M * exact random-walk touch probability(sigma), quote taken `lag` s before the fill landed')
    x,S,inv,res,hold,_=fit(ts,lo,lead,lp); np.save('bm_law.npy',x)
