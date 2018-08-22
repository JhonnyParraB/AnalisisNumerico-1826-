###Elaborado por: Jhonny Alexander Parra Barrera

##Parcial 2

#Punto 1

b) Diseñe, implemente en R i Python un algoritmo que le permita sumar los lementos de una matriz cuadrada An. Imprima varias pruebas, para diferentes valores de n y exprese f(n) en notación O()


```r
#Suma de elementos de matriz cuadrada An
#Elaborado  por Jhonny Parra
#SumarElementosMatrizCuadrada (matrix(c(1, 2, 1, 2), ncol=2))
SumarElementosMatrizCuadrada<-function(matrix){
    suma=0
    numeroSumas=0
    if (ncol(matrix)!=nrow(matrix))
      cat("El matriz no es cuadrada.")
    else{
      for (i in 1:nrow(matrix)){
        for (j in 1:ncol(matrix)){
          suma=suma+matrix[i, j]
          numeroSumas=numeroSumas+1
        }
      }
      cat("El resultado es: ", suma, " se tuvieron que hacer ", numeroSumas, " operaciones.")
    }    
}
```

Usando el algortimo podemos obtener una tabla como la siguiente donde n es el tamaño de la matriz cuadrada An y f(n) el número de sumas:

|  n | Número de operaciones f(n)  |
| ------------ | ------------ |
| 1  | 1  |
| 2 | 4  |
| 3  | 9  |
| 4  | 16   |




![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20f%5Cleft%28n%5Cright%29): Eficiencia del algoritmo, medida como el número mínimo de operaciones requeridas.


![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20f%5Cleft%28n%5Cright%29%3Dn%5E2) : Dado que se tiene que sumar cada elemento de la matriz An y en una matriz cuadrada el número de elementos es ![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20n%5E2), hay un total de ![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20n%5E2) operaciones minimas requeridas.

De esta manera la complejidad del algoritmo es de caracter ![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20O%5Cleft%28n%5E2%5Cright%29)




#Punto 3

h) Como el método permite unicamente minimizar funciones hay que convertir el problema de maximizacion en uno de minimización:
Para esto se debe multiplicar Z por -1 y reemplazar las variables por el complemento es decir, Xi por (1-Xi)

De esta forma Z queda:

Zmin=X1+0.645*X2-1.645
sujeto a las restricciones:

-50*X1-31*X2+81<=250
-3*X1-2*X-1<=4

Aquí el algoritmo implementado en R:

```r
#Programación Lineal Binaria aplicando el método aditivo de Egon Balas
#2018
#Entradas:
#z: función objetivo
#n: número de variables
#restriccionesIzquierda: arreglo con la parte izquierda de las restricciones
#restriccionesSigno: arreglo con los signos de las restricciones
#restriccionesDerecha: arreglo con la parte derecha de las restricciones
#Un ejemplo de entrada es: ProgramacionLinealBinaria (expression(X1+0.645*X2-1.645), 2, c(expression(-50*X1-31*X2+81), expression(-3*X1-2*X2-1)), c("<=","<="), c(0,0))
ProgramacionLinealBinaria<-function(z, n, restriccionesIzquierda, restriccionesSigno, restriccionesDerecha){
  
  
  menorZ=0
  infactibilidadMenor=10000000000
  iMenor=0
  iMenores=c()
  zOptimo=10000000000
  hayZOptimo=0
  solucionesMaximas=2^n
  numeroSolucion=1
  for(i in 1:n){     #Se crea el conjunto de variables Xi
    assign(paste("X", i, sep = ""), 0)    
    assign(paste("SX", i, sep = ""), 0) 
  }
  
  while(numeroSolucion<=solucionesMaximas){ #El límite del algoritmo corresponde a la soluciones máximas posibles del problema.
    if (numeroSolucion==1)
      inicio=0
    else
      inicio=1
    for (i in inicio:n){
      
      infactibilidad=0
      
      for (m in 1:n){        #Se va asignando alternativamente el valor de 1 a cada variable
        if (!(m %in% iMenores))
          assign(paste("X", m, sep = ""), 0)
        if (m==i)
          assign(paste("X", m, sep = ""), 1)
      }
      
      
      numeroSolucion=numeroSolucion+1
      for (j in 1:length(restriccionesIzquierda)){ #Para cada una de las restricciones a las que está sujeta el problema
        valorIzquierda=eval(restriccionesIzquierda[j]) #Se evalua la restricción
        cat(i,"   ", j, "   ",valorIzquierda, "|||     ")
        for (m in 1:n){
          cat(get(paste("X", m, sep = "")), " ")
        }
        cat ("\n")
        if (!eval (  parse(text=paste(valorIzquierda, restriccionesSigno[j],restriccionesDerecha[j]))  )){ #En caso de que no se cumpla se calcula la infactibilidad
          infactibilidad=infactibilidad+abs(valorIzquierda-restriccionesDerecha[j])
        }
      }
      if (infactibilidad!=0){   #Si la solución no es factible se busca la menor infactibilidad en la iteración
        if (infactibilidad<=infactibilidadMenor){
          iMenor=i
          infactibilidadMenor=infactibilidad
        }
      }
      else{     #Si la solución es factible se busca el Z menor (Z óptimo) de la iteración
        hayZOptimo=1
        posibleZ=eval(z)
        if (posibleZ<=zOptimo){
          zOptimo=posibleZ
          for (m in 1:n){
            assign(paste("SX", m, sep = ""), get(paste("X", m, sep = ""))) 
          }
        }
      }
    }
    assign(paste("X", iMenor, sep = ""), 1)
    iMenores [length(iMenores)+1]=iMenor;
    if (hayZOptimo) #En caso de que en la iteración haya un Z optimo el algoritmo ha terminado
      break
  }
  
  cat ("El Z optimo es ", zOptimo, " con   ")  #Se imprime el Z optimo y el valor que toman las variables Xi
  for (m in 1:n){
    cat(paste("X", m, sep = ""), "=", get(paste("SX", m, sep = "")), " ")
  }
}
```

Entrada:

ProgramacionLinealBinaria (expression(X1+0.645*X2-1.645), 2, c(expression(-50*X1-31*X2+81), expression(-3*X1-2*X2-1)), c("<=","<="), c(0,0))

Salida:

El Z optimo es  0  con   X1 = 1  X2 = 1  (Esto sería si la función  minimizara)

Ahora reemplazamos en Zmax y se obtiene que el optimo es 1.645 con X1=1 y X2=1


