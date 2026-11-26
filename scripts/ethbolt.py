import numpy as np
from scipy.optimize import least_squares
from scipy.stats import norm
D=0.5
GX=np.linspace(-6,6,161); GW=norm.pdf(GX); GW/=GW.sum()
def touch(S,lo,t1,sig,tau=5.0,shift=0.0):
    """random-walk touch prob of band [lo,lo+1) (tile units) over [t1,t1+tau]; arrays; shift = sampling correction in tiles"""
    S=np.asarray(S,float)[...,None]; lo=np.asarray(lo,float)[...,None]; t1=np.maximum(np.asarray(t1,float),0.02)[...,None]; sig=np.asarray(sig,float)[...,None]*np.ones_like(S)
    x=S+sig*np.sqrt(t1)*GX; st=sig*np.sqrt(tau); sh=np.asarray(shift,float)[...,None] if np.ndim(shift) else shift
    below=np.where(x<lo,2*norm.cdf((lo+sh-x)/st)-1,0.0); above=np.where(x>=lo+1,2*norm.cdf((x-lo-1+sh)/st)-1,0.0)
    return 1-((below+above)*GW).sum(axis=-1)
def load():
    T=np.load('bolt_eth_oct23.npy'); o=np.argsort(T[:,2],kind='stable'); T=T[o]
    t,ix=np.unique(T[:,2],return_index=True); px=T[ix,4]/D        # price in tiles on a 100 ms grid
    R=np.load('eth_fills_precise.npy')                          # landing time, band low ($), start, log p, won, block ts, stake
    return t,px,R
def ewma(x,h_ticks):
    a=1-0.5**(1/h_ticks); o=np.empty(len(x)); s=x[:600].mean()
    for i,xi in enumerate(x): s+=a*(xi-s); o[i]=s
    return o
