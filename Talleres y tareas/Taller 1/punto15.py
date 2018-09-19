import math

def g(x):
  return ((1+math.exp(x))/5)

def error(x):
  return abs((g(x)-x)/g(x))*100

def dg(x):
  return math.exp(x)/5

print('Ecuación a resolver: g(x)=(1+e^x)/5 en el intervalo [0,1]')
print('Ingrese x para aproximación inicial:')
x=float(input('x='))
print('     x   g(x) Error%')
for i in range(5):
  x=round(x,4)
  e=round(error(x),4)
  if abs(dg(x))<1:
    z='Cumple criterio de convergencia del punto fijo'
  print(repr(x).ljust(6,'0'),format(g(x),'.4g'), repr(e).ljust(6,'0'), z)
  x=g(x)
