
## Taller interpolación 
### Jhonny Parra

### Código en R punto 1 Unicidad polinomio:


```r
list.of.packages <- c("PolynomF")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

require(PolynomF)


options (digits = 5)
#Funcion para interpolar con el polinomio de Lagrange:
lagrange = function(x,y,a){
  n = length(x)
  if(a < min(x) || max(x) < a) stop("No está interpolando")
  X = matrix(rep(x, times=n), n, n, byrow=T)
  mN = a - X; diag(mN) = 1
  mD = X - t(X); diag(mD) = 1
  Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
  sum(y*Lnk)
}

#Puntos:
x = c( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0) 
y = c(0.31, 0.32, 0.33, 0.34, 0.45, 0.46, 0.47, 0.48, 0.49, 0.5)
lagrange(x[2:5],y[2:5], 0.35)



xdatos = x[2:5]; ydatos = y[2:5]
polinomioAjuste = poly.calc(x,y)
cat (polinomioAjuste, "\n")
#Puntos
plot(datx,daty, pch=19, cex=1, col = "blue", asp=1, xlab= "x", ylab="y") 
curve(polinomioAjuste,add=T) # Curva de ajuste (polinomio interpolante) y puntos
```

### Punto 4:

```r

list.of.packages <- c("PolynomF")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(PolynomF)


x <- c(40,50,60,70,80)
y <- c(35,83,153,193,215)

lagrange = function(x,y,a){
  n = length(x)
  if(a < min(x) || max(x) < a) stop("No está interpolando")
  X = matrix(rep(x, times=n), n, n, byrow=T)
  mN = a - X; diag(mN) = 1
  mD = X - t(X); diag(mD) = 1
  Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
  sum(y*Lnk)
}
cat("Usando Lagrange: ",lagrange(x,y,55))
error = 120 - lagrange(x,y,55)
cat ("Error: ", error)

```


funcion<-function(x) 3343-239.3667*x+6.183333*x**2-0.06733333*x**3+0.0002666667*x**4


xdatos = x[1:5]; ydatos = y[1:5]
polinomioAjuste = poly.calc(xdatos,ydatos)
cat ("Polinomio: ", polinomioAjuste)
plot(datx,daty,pch=19, cex=1, col = "purple", asp=1) 
curve(polinomioAjuste,add=T) 


valor <- funcion(55)
cat(num)
valor = 120 - num
cat("Valor: Error:",round(error,7))


