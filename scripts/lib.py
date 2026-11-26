import json,urllib.request,time
RPC="https://mainnet.megaeth.com/rpc"
EX="0x12759afca690637b425ffba3265f0dc2f6242a8d"; VA="0xdf8248fee58e791149e69f6c61129d471eafc11e"; USDM="0xfafddbb3fc7688494971a79cc65dca3ef82079e7"
T_OPEN="0x9f039a0ca58d6157d7b6914e2d60cedacf65fea21a365e93d708a5e5c25454f3"
T_SETTLE="0x90cacdb710d0777a8e5fb6387c414be82e2ffe362a703077117a2a995fce12c1"
T_BAL="0x163aa6d2d8e5248ce93dbd22509af93e5f27f8e0edc15c9e26f2867c593e0870"
def rpc(m,p,retry=4):
    for a in range(retry):
        try:
            r=urllib.request.Request(RPC,data=json.dumps({"jsonrpc":"2.0","id":1,"method":m,"params":p}).encode(),headers={"Content-Type":"application/json","User-Agent":"curl/8"})
            d=json.loads(urllib.request.urlopen(r,timeout=60).read())
            if "error" in d: raise Exception(d["error"])
            return d["result"]
        except Exception as e:
            if a==retry-1: raise
            time.sleep(1+a)
def batch(calls):
    body=[{"jsonrpc":"2.0","id":i,"method":m,"params":p} for i,(m,p) in enumerate(calls)]
    for a in range(4):
        try:
            r=urllib.request.Request(RPC,data=json.dumps(body).encode(),headers={"Content-Type":"application/json","User-Agent":"curl/8"})
            d=json.loads(urllib.request.urlopen(r,timeout=90).read())
            d.sort(key=lambda x:x["id"]); return [x.get("result") for x in d]
        except Exception as e:
            if a==3: raise
            time.sleep(1+a)
