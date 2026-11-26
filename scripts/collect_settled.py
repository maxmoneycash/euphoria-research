# logs-only collection: one JSON line per settled position (no tx fetches)
from lib import *
import json,sys,time
A0=int(sys.argv[1]); B0=int(sys.argv[2]); OUT=sys.argv[3]
TR="0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"; padEX="0x"+EX[2:].rjust(64,'0')
h=B0; start=A0; CH=2000
stakes={}  # open tx -> {from: amt}
opens={}   # pid -> (taker, txhash, block)
f=open(OUT,"w"); n=0
for a in range(start,h,CH):
    b=min(a+CH-1,h)
    ex=rpc("eth_getLogs",[{"address":EX,"fromBlock":hex(a),"toBlock":hex(b),"topics":[[T_OPEN,T_SETTLE]]}])
    tr=rpc("eth_getLogs",[{"address":USDM,"fromBlock":hex(a),"toBlock":hex(b),"topics":[TR,None,padEX]}])
    for l in tr: stakes.setdefault(l["transactionHash"],{})["0x"+l["topics"][1][-40:]]=int(l["data"],16)
    for l in ex:
        pid=l["topics"][1][:42]
        if l["topics"][0]==T_OPEN: opens[pid]=("0x"+l["topics"][2][-40:],l["transactionHash"],int(l["blockNumber"],16))
        else:
            o=opens.pop(pid,None)
            if not o: continue
            st=stakes.pop(o[1],{}); taker=o[0]
            if taker not in st or VA not in st: continue
            pot=int(l["data"][2:66],16); win="0x"+l["topics"][2][-40:]==taker
            f.write(json.dumps([o[2],int(l["blockNumber"],16),taker,st[taker]/1e18,st[VA]/1e18,int(win)])+"\n"); n+=1
    if len(stakes)>200000: stakes={k:v for k,v in list(stakes.items())[-50000:]}
    f.flush()
print("done",n,file=sys.stderr)
