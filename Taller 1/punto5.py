v=4;
ev=0.1;
t=5;
et=0.1;
rta=v*t;
vi=v-ev;
ti=t-et;
print('Vel Time Distance   Ea   Er')
while vi<=v+ev:
  d=round(vi*ti,2)
  ea=round(abs(d-rta),2)
  er=round(ea/rta*100,2)
  print(repr(vi).rjust(3), repr(ti).rjust(4), repr(d).rjust(8), repr(ea).ljust(4,'0'), repr(er).ljust(4,'0'))
  ti+=et
  if ti>t+et:
    ti=t-et
    vi+=ev
