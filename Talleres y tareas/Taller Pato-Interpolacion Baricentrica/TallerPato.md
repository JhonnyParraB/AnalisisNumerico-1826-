# Interpolación con Lagrange baricéntrico
## Realizado por: Laura Donado y Jhonny Parra

Usando el método de interpolación Lagrange baricéntrico se logró gráficar la silueta de un pato en pleno vuelo, que se puede observar a continuación.  
![Pato](https://github.com/donadol/analisis_numerico_1826/blob/master/Interpolacion/pato1.png)  
Los puntos fueron tomaron de [aquí](http://blog.espol.edu.ec/matg1013/pato-en-pleno-vuelo/).  
Lo anterior se realizó con el siguiente código en R, donde se hizo uso de la paquete pracma para la función barylag.
```r
require(pracma)

# Perfil superior
xi = c(0.9, 1.9, 2.6, 3.0, 4.4, 4.7, 6.0, 8.0, 10.5, 11.6, 12.6, 13.0, 13.3,
       # Perfil inferior cabeza
       0.817, 1.022, 1.191,  1.834, 2.264, 2.962, 4.202, 4.779,  5.527,
       # Perfil ala superior
       4.659, 4.865, 5.478, 5.527,
       # Perfil ala inferior
       4.659, 4.750, 4.990, 5.289, 5.839, 6.606, 8.141, 
       # Perfil inferior posterior
       8.473, 9.337, 10.572, 11.501, 12.364, 12.763, 13.300,
       0.817, 0.9)

# Perfil superior 
yi = c(1.3, 1.85, 2.6, 2.7, 2.15, 2.05, 2.25, 2.25, 1.4,  0.7,  0.5,  0.4,  0.25,
       # Perfil inferior cabeza    
       1.180, 1.023, 1.010,  1.085, 1.192, 1.115, 1.100, 0.608, 0.106,
       # Perfil ala superior
       -5.161, -4.741,  -0.981, 0.106,
       # Perfil ala inferior
       -5.161, -5.259, -5.284, -5.268,  -4.982,  -4.286, -1.138, 
       # Perfil inferior posterior
       -0.434,  -0.494,  -0.005, -0.085,  0.093, 0.120, 0.250,
       1.180, 1.3)

#Gráfica de los puntos
plot(xi,yi, pch=20, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Pato")

#Función para interpolar con el método Lagrange baricéntrico
#Recibe el intervalo de nodos para realizar la interpolación
DibujarLinea<-function(inicio, final){
  xi0 = xi[inicio:final]
  yi0 = yi[inicio:final]
  x0 <- seq(xi[inicio], xi[final], len=20)
  y0 <- barylag(xi0, yi0, x0)
  lines(x0, y0, col="blue")
}

#Gráfica perfil superior
DibujarLinea (1, 2)
DibujarLinea (2, 6)
DibujarLinea (6, 10)
DibujarLinea (10, 13)

#Gráfica perfil inferior cabeza
DibujarLinea (14, 16)
DibujarLinea (16, 18)
DibujarLinea (18, 20)
DibujarLinea (20, 22)

#Gráfica perfil ala superior
DibujarLinea (23, 25)
DibujarLinea (25, 26)

#Gráfica perfil ala inferior
DibujarLinea (27, 28)
DibujarLinea (28, 34)

#Gráfica perfil inferior posterior
DibujarLinea (34, 36)
DibujarLinea (36, 38)
DibujarLinea (38, 40)

#Gráfica unión perfil inferior y superior
DibujarLinea (41, 42)
```  
Se utilizaron en total 37 puntos para las interpolaciones, como resultado se obtuvo la siguiente gráfica:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Interpolacion/pato.png) 
  
## Bibliografía
- [Pato en pleno vuelo](http://blog.espol.edu.ec/matg1013/pato-en-pleno-vuelo/)  
- [Package Pracma pg 29](https://cran.r-project.org/web/packages/pracma/pracma.pdf)
