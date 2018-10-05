# Tarea de métodos númericos para integración: Aproximación de la longitud de una curva
## Elaborado por: Laura Donado y Jhonny Parra


## Descripción del problema:
Encontrar una aproximación de la longitud de una curva de una función f(x) en un intervalo dado.

## Aproximación propuesta:

Se acumuló la longitud de segmentos formados entre pares de puntos en el intervalo dado. Los "x" tenian el mismo paso y los "y" se calculaban evaluando la función. Recordando, la formula de la distancia es:

![formulaDistancia](http://www.matematicatuya.com/GRAFICAecuaciones/ImS1a1.png)

## Solución e implementación en R:

Se creó la función longitudCurva que recibe, una función f(x), a, b del intervalo [a, b] que se tomara de la curva y el número de segmentos deseado.

```r
#Longitud de curva de una función f(x)
#Usando 8 decimales de presición
#Elaborado por Laura Donado y Jhonny Parra
#2018

f<-function(f, x){
  return(eval(f))
}

distanciaPuntos<-function(x1, y1, x2, y2){
  return (sqrt ( (x2-x1)^2 + (y2-y1)^2 ) )
}

errorLongitudCurva<-function (f, valorAprox, inicio, final){
  
  a = paste ( "sqrt(1+abs(", deparse(D(f, "x")) ,")^2)")
  eval(parse(text = paste('longitudCurvaInt <- function(x) { return(' , a , ')}', sep='')))
  valorExacto=integrate (longitudCurvaInt, inicio, final)
  error = abs(valorExacto$value-valorAprox)
  return (error)
}

longitudCurva<-function(f, inicio, final, num_segmentos){
  graficarFuncion(f, inicio, final)
  sum=0
  x=seq(inicio, final,length=num_segmentos+1)
  cat("|x(i-1)        | x(i)        | Longitud recta|\n")
  for(i in 2:length(x)){
    x1=x[i-1]
    y1=f(f, x[i-1])
    x2=x[i]
    y2=f(f, x[i])
    sum=sum+distanciaPuntos (x1, y1, x2, y2)
    points(x1, y1 , pch = 20, col="red")
    points(x2, y2 , pch = 20, col="red")
    segments(x1, y1, x2, y2, col = "darkgreen", lty = par("lty"), lwd = par("lwd"))
    cat("|", format(round(x[i-1],4),nsmall=8), " | ", format(round(x[i],8),nsmall=8), " | ", format(round(distanciaPuntos (x1, y1, x2, y2)),nsmall=8), "|", "\n")
  }
  cat("La longitud de la curva en el intervalo [", inicio, ", ", final, "] con ", num_segmentos, " segmentos es: ", format(round(sum,8), nsmall=8), ", con un error de: ", format(round(errorLongitudCurva (f, sum, inicio, final),8), nsmall=8))
}

graficarFuncion<-function(f, inicio, final){
  x=seq(inicio, final,length=100)
  y=f(f, x)
  plot(x,y,type="l",lwd=1,col="blue", main= "Longitud de la curva")
}

##PRUEBA:
longitudCurva(expression(x^2), -4, 4, 5)

```

Con f(x)=x² en el intervalo [-4, 4] usando 5 segmentos, la salida es la siguiente:

|x(i-1)        | x(i)        | Longitud recta|
| ------------ | ------------ | ------------ |
| -4.00000000  |  -2.40000000  |  10.00000000 | 
| -2.40000000  |  -0.80000000  |  5.00000000 | 
| -0.80000000  |  0.80000000  |  2.00000000 | 
| 0.80000000  |  2.40000000  |  5.00000000 | 
| 2.40000000  |  4.00000000  |  10.00000000 | 

"La longitud de la curva en el intervalo [ -4 ,  4 ] con  5  segmentos es:  33.05684742 , con un error de:  0.58041971"


Gráfica:

![grafica](https://github.com/JhonnyParraB/AnalisisNumerico-1826-/blob/master/Talleres%20y%20tareas/Tareas/Imagenes%20tareas/longitudcurva.png?raw=true)


