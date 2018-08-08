import cmath
def f(x):
 return cmath.cos(3*x)+cmath.exp(x)
 #pow(x,3)-13*x-12
 #16*pow(x,4)-40*pow(x,3)+5*pow(x,2)+20*x+6
def muller(x0,x1,x2,tol,n):
  i=0
  print('Iter  X')
  while i<n:
    h1=x1-x0
    h2=x2-x1
    d1=(f(x1)-f(x0))/h1
    d2=(f(x2)-f(x1))/h2
    a=(d2-d1)/(h2+h1)
    b=d2+h2*a
    D=cmath.sqrt(b*b-4*f(x2)*a)
    if abs(b-D)<abs(b+D):
      E=b+D
    else: 
      E=b-D
    h=-2*f(x2)/E
    p=x2+h
    print(repr(i).ljust(5), p.real)
    if abs(h)<tol:
      print(f'El metodo concluyo satisfactoriamente despues de {i+1} iteraciones, solucion: {p.real}')
      return
    else:
      x0=x1
      x1=x2
      x2=p
      i+=1
  print(f'El metodo fracaso despues de {n} iteraciones')
  return


x0=float(input('Ingrese x0:'))
x1=float(input('Ingrese x1:'))
x2=float(input('Ingrese x2:'))

tol=float(input('Ingrese la tolerancia:'))
n=int(input('Ingrese número máximo de iteraciones:'))
muller(x0,x1,x2,tol,n)
