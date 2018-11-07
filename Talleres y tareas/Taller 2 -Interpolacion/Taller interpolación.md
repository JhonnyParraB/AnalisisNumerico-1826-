
## Taller interpolación 
### Jhonny Parra

Código en R punto 2:


```r
options(digits=3)


lagrange = function(x,y,a){
  n = length(x)
  X = matrix(rep(x, times=n), n, n, byrow=T)
  mN = a - X; diag(mN) = 1
  mD = X - t(X); diag(mD) = 1
  Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
  sum(y*Lnk)
}

funcion<-function(x)
{
  exp(x)
}
plot(funcion,from=0, to=1, type='l',col="blue", main="Funcion e^x", xlab="X", ylab="Y", las=1, col.axis="red")

x <- c( 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)
y <- c( funcion(0), funcion(0.1), funcion(0.2), funcion(0.3), funcion(0.4), funcion(0.5), funcion(0.6), funcion(0.7), funcion(0.8), funcion(0.9), funcion(1))

Resultados<-c(lagrange(x[2:5],y[2:5],0.1),lagrange(x[2:5],y[2:5],0.2),lagrange(x[2:5],y[2:5],0.3),lagrange(x[2:5],y[2:5],0.4))
xs<-c(0.1,0.2,0.3,0.4)
DatosX = xs[1:4]
DatosY = Resultados[1:4]
Ajuste_Polinomio <- poly.calc(DatosX,DatosY)
Ajuste_Polinomio

plot(x,y, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main = "Funcion e^x vs 1 + x + 0.483*x^2 + 0.214*x^3 ")
points(DatosX,DatosY, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y")
curve(Ajuste_Polinomio,add=T,from =0,to =1,,col="red",lwd=3)
lines(x,exp(x),col="green",lwd=3)
legend("bottomleft",col=c("red","green"),legend =c("1 + x + 0.483*x^2 + 0.214*x^3","e^x"), lwd=3, bty = "n")
```
