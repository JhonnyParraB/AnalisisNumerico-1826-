# Programación Lineal Binaria
### Presentado por: Laura Donado y Jhonny Parra
## Método Aditivo de Egon Balas

### Descripción formal 

Un problema de programación lineal es un problema de minimizar o maximizar una función lineal sujeta a restricciones lineales del tipo desigualdad, igualdad o ambas. 

Sea Z una función objetivo a minimizar de la forma:

![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5Csum%20%5C%3Aci%5Ccdot%20Xi%5C%3A)

Donde todos los ci con coeficientes no negativos.

Con ![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20X1%2C%5C%3AX2%2C%5C%3AX3...%5C%3AXn) variables independientes que pueden tomar únicamente valores de 0 y 1. Sujeta a restricciones de la forma:

![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5Csum%20%5C%3Aai%5Ccdot%20Xi%5C%3A%5Cle%20%5C%3Abi)

![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5Csum%20%5C%3Aai%5Ccdot%20Xi%5C%3A%5Cge%20%5C%3Abi)


Para cumplir las condiciones es importante tener en cuenta que:

1. La función objetivo se minimiza, en caso de maximización, se usa la regla de equivalencia: Max(Z)=Min(-Z).
2. Se requiere que ![ecuacion](https://latex.codecogs.com/gif.latex?C_%7Bj%7D%5Cgeq%200%2C%20%5Cforall%20j), donde ![ecuacion](https://latex.codecogs.com/gif.latex?C_%7Bj%7D) son los coeficientes de las restricciones. En caso que no se cumpla, entonces ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D) se sustituye por: ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D%3D1-%5Cbar%7BX_%7Bj%7D%7D), es decir ![ecuacion](https://latex.codecogs.com/gif.latex?%5Cbar%7BX_%7Bj%7D%7D) es el complemento.  

**Nota:** El cambio de variable también se debe aplicar a las restricciones.  


El método aditivo de Egon Balas se basa en que si se tiene una función objetivo minimizando y todos sus términos son positivos, entonces, entre menos variables tomen el valor de uno (1), la función objetiva será mínima.

### Algoritmo
Entrada: 
* __Z:__ Función objetivo.  
* __R:__ Vector con ecuaciones de restricción.   
  
Salida:
* __Z*:__ Solución óptima factible. 
* __X:__ Vector con valores para las variables.   
   
   
Pseudocódigo:
1. Inicializar todas las variables en 0. ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D%20%3D%200%2C%20%5Cforall%20j)
2. Inicializar j=0.
3. Evaluar cada restrición.
4. Calcular infactibilidad de la solución. 
6. Asignar Xj=1 y al resto asignar 0.
7. Aumentar j en 1.
8. Repetir pasos 3 a 6 hasta j igual al número de variables.
9. Si una solución tiene infactibilidad igual a 0, se ha encontrado la solución factible y óptima.
10. Si varias soluciones tienen infactibilidad igual a 0, se remplazan en Z y la solución óptima será aquella que haga que Z sea mínima.
11. Si ninguna de las condicionesa anteriores se cumple, se toma la solución que menor infactibilidad tenga y de ella la variable con valor 1. Se remplaza en las restricciones dicha variable y sobre las nuevas restricciones se repite los pasos 2 a 10 hasta encontrar la solución óptima factible.  

### Método implementado en R:

``` R
#Programación Lineal Binaria aplicando el método aditivo de Egon Balas: Por Laura Donado y Jhonny Parra
#2018
#Entradas:
#z: función objetivo
#n: número de variables
#restriccionesIzquierda: arreglo con la parte izquierda de las restricciones
#restriccionesSigno: arreglo con los signos de las restricciones
#restriccionesDerecha: arreglo con la parte derecha de las restricciones
#Un ejemplo de entrada es: ProgramacionLinealBinaria (expression(8*X1+7*X2+6*X3+5*X4+5*X5), 5, c(expression(-6*X1-3*X2+2*X3-4*X4-X5+3), expression(-4*X1-5*X2-4*X3-3*X4+3*X5+7)), c("<=","<="), c(0,0))
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

## Bibliografia
[Programación Lineal entera y binaria](https://es.slideshare.net/jaimemedrano771/programacin-lineal-entera-y-binaria)

