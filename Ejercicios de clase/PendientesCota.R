#10-1 a 10-6
options(digits=8)
f <- function (x){
  return (2+(exp(1)-2)*exp(-x^3))
}


pendientes<- function (a, b, h) {
  x=seq(a, b, h)
  cat ("Con h=", h, "\n")
  cat ("|  x2 | x1  |  y2 |  y1   |  m\n")
  particiones=0
  y=(f(x))
  plot (x, y, color = "red")
  for (i in 2:length(x)){
    cat (" | ", x[i], " | ", x[i-1], " | ", f(x[i]), " | ",  f(x[i-1]), " | ",  (f(x[i])-f(x[i-1]))/(h), "\n")
    particiones=particiones+1
  }
  cat ("Número de pendientes: ", particiones, "\n")
}


h=c(10^-1, 10^-2, 10^-3, 10^-4)
for (i in h){
  pendientes (-0.1, 0.1, i)
}
