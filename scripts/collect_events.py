# All-time Euphoria totals from logs: opens (taker, block), stakes into the exchange, vault deposits/withdrawals.
import json,sys,time,collections
from lib import *
TR="0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"; pad=lambda a:"0x"+a[2:].rjust(64,'0')
DEP="0xdcbc1c05240f31ff3ad067ef1ee35ce4997762752e3a095284754544f4c709d7"; WD="0xfbde797d201c681b91056529119e0b02407c7bb96a4a2c75c01fc9667232c8db"
A,B=int(sys.argv[1]),int(sys.argv[2])
def logs(flt,a,b):
    try: return rpc("eth_getLogs",[dict(flt,fromBlock=hex(a),toBlock=hex(b))],retry=8)
    except Exception as e:
        if b-a<500: raise
        m=(a+b)//2; time.sleep(1); return logs(flt,a,m)+logs(flt,m+1,b)
out=open(sys.argv[3],'a'); n=0
for a in range(A,B,50000):
    b=min(a+49999,B)
    op=logs({"address":EX,"topics":[T_OPEN]},a,b)
    tr=logs({"address":USDM,"topics":[TR,None,pad(EX)]},a,b)
    st=logs({"address":EX,"topics":[T_SETTLE]},a,b)
    out.write(json.dumps({"a":a,"opens":[[int(l["blockNumber"],16),l["topics"][2][-40:]] for l in op],
        "stakes":[[int(l["blockNumber"],16),l["topics"][1][-40:],int(l["data"],16)/1e18] for l in tr],
        "settles":[[int(l["blockNumber"],16),l["topics"][2][-40:],int(l["data"][2:66],16)/1e18] for l in st]})+"\n"); out.flush()
    n+=len(op)
    if (a-A)%1000000==0: print(a,n,flush=True)
    time.sleep(0.2)
print('done',n)
