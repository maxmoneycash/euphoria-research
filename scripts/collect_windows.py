# one settlement per block -> LOW/HIGH per 5s window, for every market seen
from lib import *
import json,sys
A,B,OUT=int(sys.argv[1]),int(sys.argv[2]),sys.argv[3]
first={}
for a in range(A,B,2000):
    for l in rpc("eth_getLogs",[{"address":EX,"fromBlock":hex(a),"toBlock":hex(min(a+1999,B)),"topics":[T_SETTLE]}]):
        first.setdefault(int(l["blockNumber"],16),[]).append(l["transactionHash"])
hs=[]
for b,v in first.items(): hs+=v[:2]     # up to 2 per block (catches a second market)
print('blocks with settles',len(first),'tx to fetch',len(hs),file=sys.stderr,flush=True)
win={}
for i in range(0,len(hs),50):
    for r in batch([("eth_getTransactionByHash",[h]) for h in hs[i:i+50]]):
        if not r: continue
        raw=bytes.fromhex(r["input"][2:])
        try:
            p=len(raw)-9; ms=int.from_bytes(raw[p-3:p],'big'); p-=3+ms; n=int.from_bytes(raw[p-2:p],'big'); p-=2; f={}; ts=0
            for _ in range(n):
                p-=65; cnt=int.from_bytes(raw[p-3:p],'big'); p-=3; sz=int.from_bytes(raw[p-4:p],'big'); p-=4; ts=int.from_bytes(raw[p-6:p],'big'); p-=6
                for _ in range(cnt):
                    val=int.from_bytes(raw[p-sz:p],'big'); p-=sz; fid=raw[p-32:p].rstrip(b'\0').decode(); p-=32; f[fid]=val/1e8
            mk=list(f)[0].split('_')[0]; win['%s:%d'%(mk,ts//1000)]=(f[mk+'_LOW'],f[mk+'_HIGH'])
        except Exception as e: pass
    if i%2000==0:
        print('fetched',i,len(win),file=sys.stderr,flush=True); json.dump(win,open(OUT,'w'))
json.dump(win,open(OUT,'w')); print('done',len(win),file=sys.stderr)
