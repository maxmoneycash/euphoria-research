# RedStone Bolt ticks from MegaETH logs for several symbols over a block range.
#   python3 tools/bolt_feed.py FROM_BLOCK TO_BLOCK outprefix BTC ETH ...   -> outprefix_<SYM>.npy of (dataTs s, price)
# Block number is about unix_seconds - 1762797011 (one block per second).
import sys,json,time,urllib.request,numpy as np
RPC="https://mainnet.megaeth.com/rpc"; F="0x897a33a0af45b3ba097bd6045187d622252e6acd"
def rpc(m,p):
    for a in range(12):
        try:
            r=urllib.request.Request(RPC,data=json.dumps({"jsonrpc":"2.0","id":1,"method":m,"params":p}).encode(),headers={"Content-Type":"application/json","User-Agent":"curl/8"})
            d=json.loads(urllib.request.urlopen(r,timeout=90).read())
            if "error" in d: raise Exception(d["error"])
            return d["result"]
        except Exception: time.sleep(min(60,3*(a+1)))
    raise SystemExit('rpc failed')
A,B,out=int(sys.argv[1]),int(sys.argv[2]),sys.argv[3]; syms=sys.argv[4:]
fid={s.encode().hex().ljust(64,'0'):s for s in syms}; T={s:[] for s in syms}
for a in range(A,B,250):
    for l in rpc("eth_getLogs",[{"address":F,"fromBlock":hex(a),"toBlock":hex(min(a+249,B))}]):
        x=l['data'][2:]; s=fid.get(x[64:128])
        if s: T[s].append((int(x[192:256],16)/1e6,int(x[0:64],16)/1e8))   # dataTs, value
    time.sleep(0.4)
    if (a-A)%10000==0: print('at',a,{s:len(T[s]) for s in syms},flush=True)
for s in syms: np.save(f'{out}_{s}.npy',np.array(T[s]))
print('done',out)
