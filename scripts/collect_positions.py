from lib import *
import json,sys
A=int(sys.argv[1]); B=int(sys.argv[2]); OUTF=sys.argv[3]
h=B
logs=[]
for a in range(A,B,1000):
    logs+=rpc("eth_getLogs",[{"address":EX,"fromBlock":hex(a),"toBlock":hex(min(a+999,h)),"topics":[[T_OPEN,T_SETTLE]]}])
opens={};settles={}
for l in logs:
    pid=l["topics"][1][:42]
    if l["topics"][0]==T_OPEN: opens[pid]=l
    else: settles[pid]=l
both=[p for p in settles if p in opens]
print(len(opens),len(settles),len(both),file=sys.stderr)
txs=set()
for p in both: txs.add(opens[p]["transactionHash"]); txs.add(settles[p]["transactionHash"])
txs=list(txs); inp={}
for i in range(0,len(txs),40):
    res=batch([("eth_getTransactionByHash",[t]) for t in txs[i:i+40]])
    for t,r in zip(txs[i:i+40],res):
        if r: inp[t]=(r["input"],r["from"])
def W(b,i): return int(b[i*64:(i+1)*64],16)
out=[]
for p in both:
    o=opens[p]; s=settles[p]
    if o["transactionHash"] not in inp or s["transactionHash"] not in inp: continue
    oi,ofrom=inp[o["transactionHash"]]; si,sfrom=inp[s["transactionHash"]]
    b=oi[10:]
    rec=dict(pid=p,taker="0x"+b[64+24:128],maker="0x"+b[128+24:192],takerAmt=W(b,3)/1e18,makerAmt=W(b,4)/1e18,und=W(b,5),nonce=W(b,6),start=W(b,7),tint=W(b,8),sp=W(b,9)/1e8,pint=W(b,10)/1e8,
             openBlock=int(o["blockNumber"],16),openTs=int(o.get("blockTimestamp","0x0"),16),settleBlock=int(s["blockNumber"],16),settleTs=int(s.get("blockTimestamp","0x0"),16),relayer=ofrom,settler=sfrom,osel=oi[:10],ssel=si[:10])
    d=s["data"][2:]; rec["payTaker"]=W(d,0)/1e18; rec["pay2"]=W(d,1)/1e18; rec["settleTopic2"]=s["topics"][2]
    # redstone parse from end
    raw=bytes.fromhex(si[2:]); 
    try:
        assert raw[-9:]==bytes.fromhex("000002ed57011e0000")
        pos=len(raw)-9; ms=int.from_bytes(raw[pos-3:pos],'big'); pos-=3+ms; n=int.from_bytes(raw[pos-2:pos],'big'); pos-=2
        pk=[]
        for _ in range(n):
            sig=raw[pos-65:pos]; pos-=65; cnt=int.from_bytes(raw[pos-3:pos],'big'); pos-=3; sz=int.from_bytes(raw[pos-4:pos],'big'); pos-=4; ts=int.from_bytes(raw[pos-6:pos],'big'); pos-=6
            for _ in range(cnt):
                val=int.from_bytes(raw[pos-sz:pos],'big'); pos-=sz; fid=raw[pos-32:pos].rstrip(b'\0').decode(); pos-=32
                pk.append((fid,val/1e8,ts))
        rec["feeds"]=pk; rec["settleArgsLen"]=pos-4
    except Exception as e: rec["feeds"]=None; rec["err"]=str(e)
    out.append(rec)
json.dump(out,open(OUTF,"w"))
print(len(out),file=sys.stderr)
