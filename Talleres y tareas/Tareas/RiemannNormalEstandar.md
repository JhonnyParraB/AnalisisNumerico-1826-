# Tarea de métodos númericos para integración: Sumas de Riemann para calcular acumulaciones de la distribución normal estándar
## Elaborado por: Laura Donado y Jhonny Parra


## Descripción del problema:

Encontrar una aproximación del área bajo la curva de la distribución normal estándar en un intervalo dado usando sumas de Riemann con cuatro cifras de presición.

## Las sumas de Riemann:

En matemáticas, la Suma de Riemann es un tipo de aproximación del valor de una integral mediante una suma finita.
Sea f(x) una función continua en [a, b] y sea un conjunto finito de puntos {x0, x1, x2,...xn} tales que a= x0<x1<x2...<xn = b.
consideramos la partición de este intervalo P=  {[x0, x1), [x1, x2), ... [xn-1, xn]}.


Entonces la suma de Riemann de f(x) es:

![imagen](http://4.bp.blogspot.com/-JOwd7DZ-wng/Txs51tPD9dI/AAAAAAAAABs/wEkDB5XZnrE/s1600/ooooo.png)

donde xi-1 ≤ yi ≤ xi. La elección de yi en este intervalo suele ser arbitraria.

Si yi = xi-1 para todo i, entonces se denomina S como la suma de Riemann por la izquierda. 
Si yi = xi, entonces se denomina S como la suma de Riemann por la derecha.
Si yi = xi + xi-1 /2 entonces se denomina S como la suma de Riemman por el centro.


## Solución e implementación en R:

```r
#Sumas de Riemann para la distribución normal estandar.
#Sumas de Riemann por derecha, izquierda y centro, para calcular el área bajo
#la curva de la distribución normal estandar usando cuatro decimales.
#Elaborado por Laura Donado y Jhonny Parra
#2018

f<-function(x){
  return (1/sqrt(2*pi)*exp(-x^2/2))
}

right<-function(inicio, final, particiones){
  graficarNormalEstandar()
  sum=0
  x=seq(inicio, final, length=particiones)
  cat("x(i-1)  | x(i)     | f(x(i))  | Área\n")
  for(i in 2:length(x)){
    s=f(x[i])*(x[i]-x[i-1])
    sum=sum+s
    rect(x[i-1], 0, x[i], f(x[i]), border="blue")
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f(x[i]),4),nsmall=4), " | ", format(round(s,4),nsmall=4), "\n")
  }
  valor_exacto=pnorm(c(final), mean = 0, sd = 1) - pnorm(c(inicio), mean = 0, sd = 1)
  error = abs (valor_exacto - sum)
  cat("El área bajo la curva en el intervalo [", inicio, ", ", final, "] con ", particiones, " particiones es: ", format(round(sum,4), nsmall=4), ", con un error de: ",format(round(error,4),nsmall=4))
}

left<-function(inicio, final, particiones){
  graficarNormalEstandar()
  sum=0
  x=seq(inicio, final,length=particiones)
  cat("x(i-1)  | x(i)     | f(x(i-1))  | Área\n")
  for(i in 2:length(x)){
    s=f(x[i-1])*(x[i]-x[i-1])
    sum=sum+s
    rect(x[i-1], 0, x[i], f(x[i-1]), border="green")
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f(x[i-1]),4),nsmall=4), " | ", format(round(s,4),nsmall=4), "\n")
  }
  valor_exacto=pnorm(c(final), mean = 0, sd = 1) - pnorm(c(inicio), mean = 0, sd = 1)
  error = abs (valor_exacto - sum)
  cat("El área bajo la curva en el intervalo [", inicio, ", ", final, "] con ", particiones, " particiones es: ", format(round(sum,4), nsmall=4), ", con un error de: ",format(round(error,4),nsmall=4))
}

midpoint<-function(inicio, final, particiones){
  graficarNormalEstandar()
  sum=0
  x=seq(inicio, final,length=particiones)
  cat("x(i-1)  | x(i)     | f((x(i)+x(i-1))/2)  | Área\n")
  for(i in 2:length(x)){
    s=f((x[i]+x[i-1])/2)*(x[i]-x[i-1])
    sum=sum+s
    rect(x[i-1], 0, x[i], f((x[i]+x[i-1])/2), border="purple")
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f((x[i]+x[i-1])/2),4),nsmall=4), "            |", format(round(s,4),nsmall=4), "\n")
  }
  valor_exacto=pnorm(c(final), mean = 0, sd = 1) - pnorm(c(inicio), mean = 0, sd = 1)
  error = abs (valor_exacto - sum)
  cat("El área bajo la curva en el intervalo [", inicio, ", ", final, "] con ", particiones, " particiones es: ", format(round(sum,4), nsmall=4), ", con un error de: ",format(round(error,4),nsmall=4))

}

#Curva distribución normal

graficarNormalEstandar <-function(){
  x=seq(-4,4,length=100)
  y=f(x)
  plot(x,y,type="l",lwd=1,col="red")
  #cat("x      |y    \n")
  for( i in 1:length(x)){
    #cat(format(round(x[i], 4), nsmall = 4), " | ", format(round(f(x[i]),4), nsmall=4), "\n")
  }
}
```


A continuación, las salidas obtenidas con el intervalo [0, 1] usando cinco particiones:

#### Con left (0, 1, 5), sumas de Riemann por la izquierda:


| x(i-1)  | x(i)     | f(x(i-1))  | Área|
| ------------ | ------------ | ------------ | ------------ |
|0.0000  |  0.2500  |  0.3989  |  0.0997|
|0.2500  |  0.5000  |  0.3867  |  0.0967|
|0.5000  |  0.7500  |  0.3521  |  0.0880|
|0.7500  |  1.0000  |  0.3011  |  0.0753|

El área bajo la curva en el intervalo [ 0 ,  1 ] con  5  particiones es:  0.3597 , con un error de:  0.0184

![left](https://github.com/JhonnyParraB/AnalisisNumerico-1826-/blob/master/Talleres%20y%20tareas/Tareas/Imagenes%20tareas/left.png)

#### Con right (0, 1, 5), sumas de Riemann por la derecha:

|x(i-1)  | x(i)     | f(x(i))  | Área|
| ------------ | ------------ | ------------ | ------------ |
|0.0000  |  0.2500  |  0.3867  |  0.0967| 
|0.2500  |  0.5000  |  0.3521  |  0.0880|
|0.5000  |  0.7500  |  0.3011  |  0.0753|
|0.7500  |  1.0000  |  0.2420  |  0.0605| 

El área bajo la curva en el intervalo [ 0 ,  1 ] con  5  particiones es:  0.3205 , con un error de:  0.0209

![right](https://github.com/JhonnyParraB/AnalisisNumerico-1826-/blob/master/Talleres%20y%20tareas/Tareas/Imagenes%20tareas/right.png)

#### Con midpoint (0, 1, 5), sumas de Riemann por el centro:

| x(i-1)  | x(i)     | f((x(i)+x(i-1))/2)  | Área |
| ------------ | ------------ | ------------ | ------------ |
|0.0000  |  0.2500  |  0.3958             | 0.0990 |
|0.2500  |  0.5000  |  0.3719             | 0.0930 |
|0.5000  |  0.7500  |  0.3282             | 0.0820 |
|0.7500  |  1.0000  |  0.2721             | 0.0680 |

El área bajo la curva en el intervalo [ 0 ,  1 ] con  5  particiones es:  0.3420 , con un error de:  6e-04

![midpoint](https://github.com/JhonnyParraB/AnalisisNumerico-1826-/blob/master/Talleres%20y%20tareas/Tareas/Imagenes%20tareas/midpoint.png)
