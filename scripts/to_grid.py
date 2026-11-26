# npy ticks (dataTs,value) -> gapless 100 ms CSV. python3 to_grid.py in.npy out.csv [tsCol valCol]
import sys,numpy as np
a=np.load(sys.argv[1]); tc=int(sys.argv[3]) if len(sys.argv)>3 else 0; vc=int(sys.argv[4]) if len(sys.argv)>4 else 1
o=np.argsort(a[:,tc],kind='stable'); t=a[o,tc]; v=a[o,vc]
k0=int(np.ceil(t[0]*10)); k1=int(np.floor(t[-1]*10)); g=np.arange(k0,k1+1)/10
i=np.searchsorted(t,g+1e-4,side='right')-1
gaps=np.diff(t); print(sys.argv[2],'ticks',len(t),'grid',len(g),'hours',round(len(g)/36000,2),'max gap s',round(gaps.max(),2),'gaps>0.5s',int((gaps>0.5).sum()))
with open(sys.argv[2],'w') as f:
    f.write('unix_seconds,price\n'); f.write('\n'.join(f'{x:.1f},{y:.5f}' for x,y in zip(g,v[i]))+'\n')
