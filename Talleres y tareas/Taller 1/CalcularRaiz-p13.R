evaluarFuncion<-function(f, x){
  return(eval(f))
}


CalcularRaiz<-function(n, a, x, precision){
  y=parse(text=paste("x^",n,"-",a))
  dy<-D(y,"x")

  iteraciones<-1
  
  
  while(TRUE){
    x<-x-(evaluarFuncion(y, x)/evaluarFuncion(dy, x))
    
    cat ("|", iteraciones, "|",x, "|", evaluarFuncion(y,x),"|","\n")
    if (abs(evaluarFuncion(y, x))<=precision)   break
    iteraciones<-iteraciones+1
  }
  
    cat ("La raiz n-esima (n=",n,") de ",a," es ",x," con un total de ",iteraciones, " iteraciones.", "\n")

}
