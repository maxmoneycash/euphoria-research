# Binance ETHUSDT trades -> last-trade price on a 100 ms grid. python3 binance_trades.py SYMBOL t0 t1 out.npy
import sys,json,time,urllib.request,numpy as np
sym,t0,t1,out=sys.argv[1],int(sys.argv[2]),int(sys.argv[3]),sys.argv[4]
def get(q):
    for a in range(10):
        try: return json.loads(urllib.request.urlopen(urllib.request.Request("https://data-api.binance.vision/api/v3/aggTrades?symbol="+sym+"&limit=1000&"+q,headers={"User-Agent":"curl/8"}),timeout=30).read())
        except Exception as e: time.sleep(2*(a+1))
    raise SystemExit('failed')
d=get(f"startTime={t0*1000}&endTime={t0*1000+60000}"); T=[];P=[]; n=0
while d:
    for x in d: T.append(x['T']);P.append(float(x['p']))
    if d[-1]['T']>=t1*1000: break
    d=get(f"fromId={d[-1]['a']+1}"); n+=1; time.sleep(0.12)
    if n%100==0: print(n,len(T),(T[-1]/1000-t0)/(t1-t0),flush=True)
T=np.array(T)/1000;P=np.array(P)
g=np.arange(t0,t1,0.1); i=np.searchsorted(T,g,side='right')-1
np.save(out,np.c_[g,P[np.clip(i,0,None)]]); print('done',len(T))
