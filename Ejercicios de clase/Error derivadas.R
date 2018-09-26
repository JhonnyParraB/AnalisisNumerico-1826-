options(digits=8)
f<-function(f, x){
  return(eval(f))
}




evaluarFuncionXs<-function(y, xs){
cat ("x               y\n")

for (i in 1:length(xs)){
  cat (xs[i], "      ", f(y, xs[i]), "\n")
}
}

aproximacionUno<-function (y, xs, h){
  cat ("Usando 4.4 con h = ", h, "\n")
  cat ("x               y         Error\n")   
  
  for (i in 1:length(xs)){
    
    aproximacion = (1/(2*h)) * (  (-3)*f(y, xs[i]) +  4*f(y, (xs[i]+h))  -  f(y, (xs[i]+2*h))   )
    error = abs(aproximacion - evaluarFuncion (D(y, "x"), xs [i])) 
    cat (xs[i], "      ", aproximacion, "      ", error,  "\n")
  }
}

aproximacionDos<-function (y, xs, h){
  cat ("Usando 4.5 con h = ", h, "\n")
  cat ("x               y         Error\n")   
  
  for (i in 1:length(xs)){
    aproximacion = (1/(2*h)) * (  f(y, xs[i]+h) -  f(y,   xs[i]-h) )
    error = abs(aproximacion - evaluarFuncion (D(y, "x"), xs [i])) 
    cat (xs[i], "      ", aproximacion, "      ", error,  "\n")
  }
}

evaluarFuncionXs (expression (x*exp(x)), c(1.8, 1.9, 2.0, 2.1, 2.2))

fx=expression (x*exp(x))
xs=c(1.8, 1.9, 2.0, 2.1, 2.2)
hs=c(0.1, 0.01, 0.001, 0.0001)
for (i in 1:length (hs)){
  aproximacionUno (fx, xs, hs[i])
  aproximacionDos (fx, xs, hs[i])
}
