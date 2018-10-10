# Tarea de métodos númericos para integración: Aproximación de la longitud de una curva de Koch
## Elaborado por: Laura Donado y Jhonny Parra


## Descripción del problema:
Encontrar una aproximación de la longitud de una curva de Koch con un número de iteraciones dado.

## Aproximación propuesta:

Para la creación de la curva de Koch se utilizó la función koch del paquete alphahull, la cual recibe como parametros side y niter, 
que son la longitud del triangulo equilatero inicial y el número de iteraciones para el copo de nieve, respectivamente. 
Dicha función retorna una matriz de 2 columnas con las coordenadas de los vertices de la curva.  
Para el cálculo de la longitud total de la curva, se acumuló la longitud de segmentos formados entre pares de puntos de la curva de Koch.  
Recordando, la formula de la distancia es:  

![formulaDistancia](http://www.matematicatuya.com/GRAFICAecuaciones/ImS1a1.png)  

Para el cálculo del error, se utilizó la ecuación de longitud de perimetro de la curva de Koch, la cual es:  
![ecuacion](https://latex.codecogs.com/gif.latex?L_{n}=3*(\frac{4}{3})^{n})  
Donde n es el número de iteracciones.  

## Solución e implementación en R:

Se creó la función longitudCurva que recibe el número de iteraciones para la curva de Koch.

```r
#Longitud de la curva de Koch
#Usando 8 decimales de presición
#Elaborado por Laura Donado y Jhonny Parra
#2018

distanciaPuntos<-function(x1, y1, x2, y2){
  return (sqrt ( (x2-x1)^2 + (y2-y1)^2 ) )
}

errorLongitudCurva<-function (n,valorAprox){
  valorExacto= 3*(4/3)^n
  error = abs(valorExacto-valorAprox)
  return (error)
}

snowflake<-function(n){
  vertices <- koch(side = 1, niter = n)
  plot(vertices[, 1], vertices[, 2], type = "l", asp = TRUE, main = "Koch snowflake", xlab = "", ylab = "", col = "black")
  segments(vertices[nrow(vertices), 1], vertices[nrow(vertices), 2], vertices[1, 1], vertices[1, 2], col = "black")
}

longitudCurva<-function(niter){
  snowflake(niter)
  sum=0
  x=koch(side = 1, niter = niter)
  cat("|x(i-1)        | y(i-1)       | x(i)          | y(i)         | Longitud    |\n")
  for(i in 2:nrow(x)){
    x1=x[i-1,1]
    y1=x[i-1,2]
    x2=x[i,1]
    y2=x[i,2]
    sum=sum+distanciaPuntos (x1, y1, x2, y2)
    points(x1, y1 , pch = 20, col="red")
    points(x2, y2 , pch = 20, col="red")
    segments(x1, y1, x2, y2, col = "darkgreen", lty = "dashed", lwd =3)
    cat("|", format(round(x1,8),nsmall=8), " | ", format(round(y1,8),nsmall=8), " | ", format(round(x2,8),nsmall=8), " | ", format(round(y2,8),nsmall=8), " | ", format(round(distanciaPuntos (x1, y1, x2, y2),8),nsmall=8), "|", "\n")
  }
  x1=x[nrow(x),1]
  y1=x[nrow(x),2]
  x2=x[1,1]
  y2= x[1,2]
  sum=sum+distanciaPuntos (x1, y1, x2, y2)
  points(x1, y1 , pch = 20, col="red")
  points(x2, y2 , pch = 20, col="red")
  segments(x1, y1, x2, y2, col = "darkgreen", lty = "dashed", lwd = 3)
  cat("|", format(round(x1,8),nsmall=8), " | ", format(round(y1,8),nsmall=8), " | ", format(round(x2,8),nsmall=8), " | ", format(round(y2,8),nsmall=8), " | ", format(round(distanciaPuntos (x1, y1, x2, y2),8),nsmall=8), "|", "\n")
  cat("La longitud de la curva de Koch con ", niter, " iteraciones es: ", format(round(sum,8), nsmall=8), ", con un error de: ", format(round(errorLongitudCurva (niter-1, sum),8), nsmall=8))
}

##PRUEBA:
longitudCurva(2)
```

Con 2 iteraciones, la salida es la siguiente:

|x(i-1)        | y(i-1)       | x(i)          | y(i)         | Longitud    |
| ------------ | ------------ | ------------ |------------ |------------ |
| -0.50000000  |  0.00000000  |  -0.33333333  |  0.28867513  |  0.33333333 | 
| -0.33333333  |  0.28867513  |  -0.50000000  |  0.57735027  |  0.33333333 | 
| -0.50000000  |  0.57735027  |  -0.16666667  |  0.57735027  |  0.33333333 | 
| -0.16666667  |  0.57735027  |  0.00000000  |  0.86602540  |  0.33333333 | 
| 0.00000000  |  0.86602540  |  0.16666667  |  0.57735027  |  0.33333333 | 
| 0.16666667  |  0.57735027  |  0.50000000  |  0.57735027  |  0.33333333 | 
| 0.50000000  |  0.57735027  |  0.33333333  |  0.28867513  |  0.33333333 | 
| 0.33333333  |  0.28867513  |  0.50000000  |  0.00000000  |  0.33333333 | 
| 0.50000000  |  0.00000000  |  0.16666667  |  0.00000000  |  0.33333333 | 
| 0.16666667  |  0.00000000  |  0.00000000  |  -0.28867513  |  0.33333333 | 
| 0.00000000  |  -0.28867513  |  -0.16666667  |  0.00000000  |  0.33333333 | 
| -0.16666667  |  0.00000000  |  -0.50000000  |  0.00000000  |  0.33333333 | 

"La longitud de la curva de Koch con  2  iteraciones es:  4.00000000 , con un error de:  0.00000000"


Gráfica:

![grafica](https://github.com/donadol/analisis_numerico_1826/blob/master/Talleres%20y%20Tareas/Derivadas%20e%20Integrales/niter2.png?raw=true)

## Bibliografía:
- [Koch function](https://www.rdocumentation.org/packages/alphahull/versions/2.1/topics/koch)
- [Koch Snowflake](http://mathworld.wolfram.com/KochSnowflake.html)
