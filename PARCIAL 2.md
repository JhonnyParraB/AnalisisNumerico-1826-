###Elaborado por: Jhonny Alexander Parra Barrera
##Parcial 2

Punto 1

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


![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20f%5Cleft%28n%5Cright%29%3Dn%5E2) : Dado que se tiene que sumar cada elemento de la matriz An y en una matriz cuadrada el número de elementos es ![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20n%5E2), hay un total de https://latex.codecogs.com/gif.latex?%5Cbg_white%20n%5E2 operaciones minimas requeridas.

De esta manera la complejidad del algoritmo es de caracter ![imagen](https://latex.codecogs.com/gif.latex?%5Cbg_white%20O%5Cleft%28n%5E2%5Cright%29)



