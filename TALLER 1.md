# Taller 1: Métodos númericos
 ## Elaborado por: Laura Donado y Jhonny Parra






### -Punto número 2
**Descripción del problema:** Se necesita un recipiente rectangular, sin tapa, de un litro de capacidad. Para construirlo se debe usar una lámina rectangular de 32cm de largo y 24 cm de ancho. El procedimiento será recortar un cuadrado idéntico en cada una de las cuatro esquinas y doblar los bordes de la lámina para formar el recipiente.

**Objetivo**: Determinar la medida del lado del cuadrado que se debe recortar en cada esquina para que el recipiente tenga la capacidad requerida. Se debe hacer uso de dos métodos distintos para resolver el problema.


------------

**Planteamiento del problema**: Se cuenta con métodos que encuentran raices de funciones para resolver el problema tales como la trisección o la cuatrisección, luego se debe proponer una función que cumpla que su raiz (x tal que f(x)=0) actue como la medida del lado del cuadrado que se debe recortar en cada esquina de la caja.


![ecuacion](http://latex.codecogs.com/gif.latex?V_%7Bcaja%7D%3D%5Cleft%2832-2x%5Cright%29%5Ccdot%20%5Cleft%2824-2x%5Cright%29%5Ccdot%20x)


![ecuacion](http://latex.codecogs.com/gif.latex?V_%7Bcaja%7D%3D4x%5E3-112x%5E2&plus;768x%5C%3A%5C%3A%5C%3A%5Cleft%28Simplificando%5Cright%29)



Luego, para efectos de la solución del problema, igualamos a 1000 el volumen de la caja.

![ecuacion](http://latex.codecogs.com/gif.latex?V_%7Bcaja%7D%3D1000)


![ecuacion](http://latex.codecogs.com/gif.latex?4x%5E3-112x%5E2&plus;768x%3D1000)


![ecuacion](http://latex.codecogs.com/gif.latex?f%5Cleft%28x%5Cright%29%3D4x%5E3-112x%B2&plus;768x-1000%3D0%5C%3A%5C%3A%5C%3A%5C%3A%5Cleft%28Se%5C%3Atiene%5C%3Ala%5C%3Afunci%F3n%5C%3Abuscada%5C%3Aigualada%5C%3Aa%5C%3A0%5Cright%29)



Para hallar la solución se uso el método de trisección y cuatrisección con una precisión de 10^-8:

```cpp
/*Trisección
 *Hecho por Jhonny Alexander Parra 
 *2018
*/

#include <iostream>
#include<stdio.h>
#include<cmath>
#include <iomanip> 

using namespace std;

double f (double x);
double v (double x);
int main()
{
    double a, b, c, d;
    double precision=0.00000001;
    double raiz;
    int iteracion=1;
    cout<<fixed;
    cout<<setprecision(8);
    cout<<"Ingrese a del intervalo [a, b] para realizar la triseccion: ";
    cin>>a;
    cout<<"Ingrese b del intervalo [a, b] para realizar la triseccion: ";
    cin>>b;
    if (f(a)*f(b)>0){
        cout<<"El intervalo dado no contiene la raiz."<<endl;
        return 0;
    }
    while (true){
        c=(b+2*a)/3;
        d=(2*b+a)/3;     
        
        cout<<"|"<<iteracion<<"|";
        cout<<c<<"|";
        cout<<f(c)<<"|";
        if (abs(f(c))<=precision){
            raiz=c;
            break;
        }
        cout<<d<<"|";
        cout<<f(d)<<"|"<<endl;
        if (abs(f(d))<=precision){
            raiz=d;
            break;
        }
            
        if (f(a)*f(c)<0)
            b=c;
        if (f(c)*f(d)<0){
            a=c;
            b=d;
        }
        if (f(d)*f(b)<0)
            a=d;     
        iteracion++;
        
    }
   
    cout<<endl<<"La raiz es: "<<raiz<<endl;  
    cout<<endl<<"El volumen seria: "<<v(raiz);
    return 0;
}

double f (double x){
    return 768*x-112*pow (x, 2)+4*pow (x,3)-1000;
}
double v (double x){
    return (32-2*x)*(24-2*x)*x;
}
```
Nota: La escogencia de los intervalos se hizo de acuerdo a los extremos de la función.

Entrada: Intervalo [1, 5].
Resultado: 1.69627683  después de 21 iteraciones.

Entrada: Intervalo [6, 10]
Resultado: 8.09321954 después de 21 iteraciones.

Entrada: Intervalo [16, 20]
Resultado: 18.21050363 después de 23 iteraciones.

```cpp
/*Cuatrisección
 *Hecho por Jhonny Alexander Parra 
 *2018
*/

#include <iostream>
#include<stdio.h>
#include<cmath>
#include <iomanip> 

using namespace std;

double f (double x);
double v (double x);
int main()
{
    double a, b, c, d, e;
    double precision=0.00000001;
    double raiz;
    int iteracion=1;
     cout<<fixed;
    cout<<setprecision(8);
    cout<<"Ingrese a del intervalo [a, b] para realizar la cuatriseccion: ";
    cin>>a;
    cout<<"Ingrese b del intervalo [a, b] para realizar la cuatriseccion: ";
    cin>>b;
    if (f(a)*f(b)>0){
        cout<<"El intervalo dado no contiene la raiz."<<endl;
        return 0;
    }
    while (true){
       
        cout<<"|"<<iteracion<<"|";
        c=(b+3*a)/4;
        d=(b+a)/2;
        e=(3*b+a)/4;
        
        cout<<c<<"|";
        cout<<f(c)<<"|";
        if (abs(f(c))<=precision){
            raiz=c;
            break;
        }
        cout<<d<<"|";
        cout<<f(d)<<"|";
        if (abs(f(d))<=precision){
            raiz=d;
            break;
        }
        
        cout<<e<<"|";
        cout<<f(e)<<"|"<<endl;
        if (abs(f(e))<=precision){
            raiz=e;
            break;
        }            
        
        if (f(a)*f(c)<0)
            b=c;
        if (f(c)*f(d)<0){
            a=c;
            b=d;
        }
        if (f(d)*f(e)<0){
            a=d;
            b=e;
        }
        if (f(e)*f(b)<0)
            a=e;  
        iteracion++;        
    }
    
    cout<<endl<<"La raiz es: "<<raiz<<endl;
    cout<<endl<<"El volumen seria: "<<v(raiz);
    
    return 0;
}

double f (double x){
    return 768*x-112*pow (x, 2)+4*pow (x,3)-1000;
}

double v (double x){
    return (32-2*x)*(24-2*x)*x;
}
```

Entrada: Intervalo [1, 5].
Resultado: 1.69627683  después de 18 iteraciones.

Entrada: Intervalo [6, 10]
Resultado: 8.09321954 después de 17 iteraciones.

Entrada: Intervalo [16, 20]
Resultado: 18.21050363 después de 18 iteraciones.

Se comprobó el volumen con todos los resultados y siempre se obtuvo 1000.00000000 cm³ con una incertidumbre de más o menos 10^-8.


------------

Respuesta a las preguntas propuestas:
1. ¿Cual es la etapa del proceso de resolución de un problema númerico que requiere más atención?
Ciertamente los métodos numéricos ya han sido pensados e implementados, lo único que requiere atención es su inclusión en la resolución de los problemas, es decir, como a partir de un problema se encuentra la forma de usar un método númerico para hallar la solución.

2. ¿Que conocimientos son necesarios para formular un modelo matemático?
Conocimientos básicos de ecuaciones y de geometría como el volumen de una caja rectangular.
3. En el ejemplo de la caja ¿Cual sería la desventaja de intentar obtener experimentalmente la solución mediante prueba y error en lugar de analizar el modelo matemático?
Podría tomar mucho tiempo, más aún si se tiene en cuenta que hay tres soluciones disponibles. Por otra parte conseguir una presición adecuada en la solución a través de prueba y error sería tedioso y tardio.

4. ¿Qué es más critico: el error de truncamiento o el error de redondeo?

5. ¿Cuál es la ventaja de instrumentar computacionalmente un método numérico?
Es mucho más eficiente que la computadora realice las operaciones de un método numérico, además se reducen significativamente los errores humanos en el proceso.

6. ¿Por qué es importante validar los resultados obtenidos?
	Porque en muchas ocasiones a pesar de que el método de análisis numérico utilizado converge, la solución puede que no aplique para resolver el problema.


### -Punto número 6
La eficiencia de un algoritmo está denotada por T(n).


(a)


**Descripción:** Se debe ejecutar el siguiente algoritmo (implementado en c++) con la entrada n=73.

```cpp
#include <iostream>
#include <string>

using namespace std;

int main()
{
    int n;
    int d;
    cout<<"Ingrese el n: ";
    cin>>n;
    int divisiones=0;
    while (n>0){
        d=n%2;
        n=n/2; 
        divisiones++;
        cout<<d<<endl;
    }
    cout<<"El numero de divisiones fue "<<divisiones;
}

```
Entrada= n=73.

Salida:

1

0

0

1

0

0

1

El numero de divisiones fue 7

------------


(b)


**Descripción:** Suponga que T(n) representa la cantidad de operaciones aritmeticas de división que se realizan para resolver el problema de tamaño n. Encuentre T(n) y exprésela con la notación O() para obtener T(n) observe el hecho de que en cada ciclo el valor de n se reduce aproximadamente a la mitad.

**Solución:** 

![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3D1&plus;T%5Cleft%28n/2%5Cright%29%5C%3Adonde%5C%3Ael%5C%3Acaso%5C%3Abase%5C%3Aes%5C%3AT%5Cleft%281%5Cright%29%3D1)

T(n)=1+T(n/2) donde el caso base es T(1)=1.


Luego se tiene que:

![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%28n/2%5Cright%29&plus;1)
T(n)=T(n/2)+1

![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%28%5Cfrac%7Bn%7D%7B2%5Ek%7D%5Cright%29&plus;k%5C%3A%5Cleft%28Donde%5C%3Ak%5C%3Aes%5C%3Ael%5C%3Anumero%5C%3Ade%5C%3Aiteraciones%5Cright%29)
T(n)=T(n/2^k)+k (Donde k es el número de iteraciones)

![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%28%5Cfrac%7Bn%7D%7B2%5E%7B%5Cleft%28%5Clog%20_2%5Cleft%28n%5Cright%29%5Cright%29%7D%7D%5Cright%29&plus;%5Clog%20%5C%3A_2%5Cleft%28n%5Cright%29%5C%3A)
T(n)=T(n/2^(log2(n)))+log2(n) 

![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%281%5Cright%29&plus;%5Clog%20_2%5Cleft%28n%5Cright%29)
T(n)=T(1)+log2(n)

![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3D1&plus;%5Clog%20_2%5Cleft%28n%5Cright%29%5C%3A%5Cleft%28Aplicando%5C%3Ael%5C%3Acaso%5C%3Abase%5C%3Aque%5C%3Adice%5C%3Aque%5C%3AT%5Cleft%281%5Cright%29%3D1%5Cright%29)

De esta manera, T(n) es de orden O(log n).

### -Punto número 7

**Descripción del problema**: Utilice el método de Newton para resolver el problema, muestre gráficamente cómo se comporta la convergencia a la solución. Una partícula se mueve en el espacio con el vector de posición R(t)=(2cos(t), sen(t), 0). Se requiere conocer el tiempo en el que el objeto se encuentra más cerca del punto P(2,1,0). Utilice el método de Newton con cuatro decimales de precisión.


------------

**Planteamiento del problema**: El método numérico de Newton sirve para hallar raices. El problema requiere encontrar la minima distancia que hay entre el punto P y un punto determinado de R(t).
Para ello se plantea la función d(t) que representa la distancia entre el punto P y cualquier punto de R(t):

d(t)=sqrt((2-2*cos(x))^2+(1-sin(x))^2)

Para encontrar el mínimo debemos igualar d'(t)=0, es aquí donde el método de Newton permite resolver el ejercicio. A continuación la implementación del método de Newton en lenguaje R:

```r
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
```
La selección del x0 se hizo con ayuda de la gráfica de la función d'(t).

Entrada: NewtonRaphson(D(expression(sqrt((2-2*cos(x))^2+(1-sin(x))^2)), "x"), 0.5, 0.0001)
Se ingresó la d'(t) como la función a la que se le quiere encontrar la raiz, x0=0.5 como el punto aproximado a la raiz y se estableció una precisión de 0.0001.

Salidas (Resultado):

|  #Iteración|t   |  d'(t) |
| ------------ | ------------ | ------------ |
| 1 | 0.6000476 | 0.063255 | 
| 2 | 0.5873245 | 0.0005119039 | 
| 3 | 0.5872198 | 4.076899e-08 |

La raiz es 0.5872 y se obtuvo después de tres iteraciones. Es un mínimo local.

Es importante tener en cuenta que una mala selección del x0 puede llevar a la divergencia del método o a obtener un t que corresponda a un máximo y no a un mínimo de la función d(t). En el ejercicio se hizo uso del criterio de la segunda derivada para asegurar que el t obtenido correspondiera con un mínimo local en d(t).

Luego como la curva parametrica no tiene un tiempo delimitado, lo que nos permite suponer que la particula se mueve infinitamente, y la función seno y coseno tienen un período de 2pi, la solución quedaría expresada de la siguiente manera:

La particula está más cerca al punto P(2, 1, 0) en el tiempo t=0.5872+(2pi)n donde n es un número entero no negativo según la connotación de t como tiempo del problema.

La convergencia de la solución se puede observar en la siguiente gráfica:


### -Punto número 13
**Descripción**: Encuentre una fórmula iterativa de convergencia cuadrática y defina un intervalo de convergencia apropiado para calcular la raiz real n-ésima de un número real. El algoritmo solamente debe incluir operaciones airtméticas elementales.

**Solución**: El siguiente es un método basado en el método de Newton que permite obtener la raiz n-esima de un número a. La solución de la siguiente ecuación igualada a 0 permite determinar la raiz n-esima del número a:

f(x)=x^n-a 

Al igual que en el método de Newton es necesario dar un x0.
Aquí la implementación de la solución en lenguaje R:

```r


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
```

Entrada: CalcularRaiz(n = 4,a = 256,x = 5,precision = 0.0001)
Salidas:

|  #Iteración|a^(1/n)  |  f(x) |
| ------------ | ------------ | ------------ |
| 1 | 4.262 | 73.95429 | 
| 2 | 4.023184 | 5.986956 | 
| 3 | 4.0002 | 0.05111035 | 
| 4 | 4 | 3.825673e-06 | 

La raiz n-esima (n= 4 ) de  256  es  4  con un total de  4  iteraciones. 

Aunque el método no diverge, es importante que el número x0 sea un número positivo siempre que se quiera evaluar una raiz n-esima donde n es un número par.









