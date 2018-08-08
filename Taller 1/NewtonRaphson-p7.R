NewtonRaphson<-function(y, x, precision){
  dy<-D(y,"x")
  iteraciones<-0
  while(1){
    x<-x-evaluarFuncion(y, x)/evaluarFuncion(dy, x)
    iteraciones<-iteraciones+1
    if (evaluarFuncion(y, x)<=precision) break

  }
  cat ("La raiz es ",x," con un total de ",iteraciones, " iteraciones.")
}
