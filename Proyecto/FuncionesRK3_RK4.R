#Elaborado por: Laura Donado y Jhonny Parra
#2018
#Preguntas:
# Limitar h por el número de particiones o por el tamaño del salto
# Cómo calcular el error: cómo encontrar la solución de forma analitica



library(phaseR)

f<-function(fcn,x,y){
  return(eval(fcn))
}


graficarCampoPendiente<-function(xinicial, xfinal, yinicial, yfinal, fcn, numpendientes, metodo){
  cat ("xinicial: ", xinicial, "xfinal:", xfinal, "\n")
  cat ("yinicial: ", yinicial, "yfinal:", yfinal, "\n")
  apma1 <- function(t, y, parameters){
    a <- parameters[1] 
    dy <- a*(f(fcn, t, y))
    list(dy)
  } 
  apma1.flowField <- flowField(apma1, x = c(xinicial, xfinal), 
                               y   = c(yinicial, yfinal), parameters = c(1), 
                               points = numpendientes, system = "one.dim", 
                               add = FALSE, xlab = "x", ylab = "y", 
                               main = metodo)
  grid()
}

graficarSolucionNumerica<-function (x, y){
  points (x, y, pch=20, col="blue")
  for (i in 2:length(x)){
    segments(x[i-1], y[i-1], x[i], y[i], col="red")
  }
}

rk4<-function(fcn, ti, tf, y0, h, graficar=TRUE, numpendientes=10){
  
  t<-seq(ti, tf, h)
  y<-c(y0)
  for(i in 2:length(t)){
    k1=h*f(fcn, t[i-1], y[i-1])
    k2=h*f(fcn, t[i-1]+h/2, y[i-1]+k1*(0.5))
    k3=h*f(fcn, t[i-1]+h/2, y[i-1]+k2*(0.5))
    k4=h*f(fcn, t[i-1]+h, y[i-1]+k3)
    y<-c(y, y[i-1]+1/6*(k1+2*k2+2*k3+k4))
  }
  if (graficar){
    graficarCampoPendiente(min(t), max(t), min(y), max(y), fcn, numpendientes, "RK4")
    graficarSolucionNumerica(t, y)
  }
  rta<-list(y=y, t=t)
}


rk3<-function(fcn, ti, tf, y0, h, graficar=TRUE, numpendientes=10){
  t<-seq(ti, tf, h)
  y<-c(y0)
  for(i in 2:length(t)){
    k1=h*f(fcn, t[i-1], y[i-1])
    k2=h*f(fcn, t[i-1]+h/2, y[i-1]+k1*(0.5))
    k3=h*f(fcn, t[i-1]+h, y[i-1]-k1+2*k2)
    y<-c(y, y[i-1]+1/6*(k1+4*k2+2*k3))
  }
  if (graficar){
    graficarCampoPendiente(min(t), max(t), min(y), max(y), fcn, numpendientes, "RK3")
    graficarSolucionNumerica(t, y)
  }
  rta<-list(y=y, t=t)
}


r<-rk4(expression(x+y), 0, 3, 1, 0.1)
r$y
r$t
r2<-rk3(expression(x+y), 0, 2, 1, 0.1)
r2$y
r2$t
