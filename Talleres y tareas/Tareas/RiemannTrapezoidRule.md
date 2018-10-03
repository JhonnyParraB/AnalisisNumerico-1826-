# Tarea de métodos númericos para integración: Calcular el área entre dos curvas por medio de la regla del trapecio
## Elaborado por: Laura Donado y Jhonny Parra


## Descripción del problema:

Encontrar una aproximación del área entre dos curva en un intervalo dado usando la regla del trapecio con cuatro cifras de presición.

## Regla del trapecio:

En matemáticas, la regla del trapecio es un método para calcular aproximadamente el valor de una integral definida mediante una suma finita. 
La regla se basa en aproximar el valor de la integral de f(x) por el de la función lineal, que pasa a través de los puntos (a, f(a)) y (b, f(b)).
Sea f(x) una función continua en [a, b], y sea un conjunto finito de puntos {x0, x1, x2,...xn} tales que a= x0<x1<x2...<xn = b.
consideramos la partición de este intervalo P=  {[x0, x1), [x1, x2), ... [xn-1, xn]}.



## Solución e implementación en R:

```r
f<-function(x){
  #x^3-9*x
  return(sin(x))
}

g<-function(x){
  #9-x^2
  return(cos(x))
}

trapezoid<-function(inicio, final, particiones){
  graficarFcn()
  h=(final-inicio)/particiones
  x=seq(inicio, final, length=particiones+1)
  sum=0
  cat("x(i-1)   | x(i)      | f(x(i-1)) | f(x(i))   | g(x(i-1))| g(x(i))  | Área\n")
  for(i in 2:length(x)){
    b1=abs(f(x[i-1]))+abs(g(x[i-1]))
    b2=abs(f(x[i]))+abs(g(x[i]))
    A=h/2*(b1+b2)
    sum=sum+A
    segments(x[i-1], f(x[i-1]), x[i-1], g(x[i-1]))
    segments(x[i], f(x[i]), x[i], g(x[i]))
    segments(x[i-1], f(x[i-1]), x[i], f(x[i]))
    segments(x[i-1], g(x[i-1]), x[i], g(x[i]))
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f(x[i-1]),4),nsmall=4), " | ", format(round(f(x[i]),4),nsmall=4)," | ", format(round(g(x[i-1]),4),nsmall=4), " | ", format(round(g(x[i]),4),nsmall=4), " | ", format(round(A,4),nsmall=4), "\n")
  }
  
}

graficarFcn<-function(){
  x<-seq(-4, 4, .1)
  plot(x, f(x), col="blue",type = "l")
  lines(x, g(x), col="red", type = "l")
}
```


A continuación, las salidas obtenidas con el intervalo [-pi/2, pi/2] usando diez particiones:

#### Con trapezoid(-pi/2, pi/2, 10):
|x(i-1)   | x(i)      | f(x(i-1))  | f(x(i))  | g(x(i-1))  | g(x(i))  | Área|
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|-1.5708  | -1.2566   |  -1.0000  |  -0.9511 | 0.0000  |  0.3090  |  0.3550 |
|-1.2566  |  -0.9425  |  -0.9511  |  -0.8090 | 0.3090  |  0.5878  |  0.4173 |
|-0.9425  |  -0.6283  |  -0.8090  |  -0.5878 | 0.5878  |  0.8090  |  0.4388 |
|-0.6283  |  -0.3142  |  -0.5878  |  -0.3090 | 0.8090  |  0.9511  |  0.4173 |
|-0.3142  |  0.0000   |  -0.3090  |  0.0000  | 0.9511  |  1.0000  |  0.3550 |
|0.0000   |  0.3142   |  0.0000   |  0.3090  | 1.0000  |  0.9511  |  0.3550 |
|0.3142   |  0.6283   |  0.3090   |  0.5878  | 0.9511  |  0.8090  |  0.4173 |
|0.6283   |  0.9425   |  0.5878   |  0.8090  | 0.8090  |  0.5878  |  0.4388 |
|0.9425   |  1.2566   |  0.8090   |  0.9511  | 0.5878  |  0.3090  |  0.4173 |
|1.2566   |  1.5708   |  0.9511   |  1.0000  | 0.3090  |  0.0000  |  0.3550 |


![trapezoid](https://github.com/donadol/analisis_numerico_1826/blob/master/Talleres%20y%20Tareas/trapezoid.png)
