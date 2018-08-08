
# Taller 1: Métodos Numéricos
## Presentado por: Jhonny Parra y Laura Donado

### Lista de Contenidos
1. [Punto 1](#punto-1)
2. [Punto 2](#punto-2)
3. [Punto 5](#punto-5)
4. [Punto 6](#punto-6)
5. [Punto 7](#punto-7)
6. [Punto 11](#punto-11)
7. [Punto 13](#punto-13)
8. [Punto 15](#punto-15)

### Punto 1
**Descripción del problema:** Evaluar el polinomio en cada valor indicado y el número de operaciones mínimo para hacerlo, para el siguiente polinomio junto con su derivada.  
![ecuacion](http://latex.codecogs.com/gif.latex?P%28x%29%20%3D%207x%5E5%20&plus;%206x%5E4%20-%206x%5E3%20&plus;%203x%20-4%2C%20x_%7B0%7D%20%3D%203)  
**Planteamiento del problema:** Para hallar la solución se utilizó el siguiente código, el cual esta basado en el propuesto en el taller añadiendo el cálculo del número de operaciónes mínimas realizadas. Para dicho cálculo, se tiene en cuenta que una división es un amultiplicación, una multiplicación son varias sumas y una suma es una operación.  
``` c++
#include <iostream>
#include <cmath>

using namespace std;

double horner(double p[], int n, double x, int &o){
  double y=p[0];
  for(int i=1; i<n; i++){
    if(x<y)
      o+=x;
    else
      o+=y;
    o++;
    y=x*y+p[i];
  }
  return y;
}
double eval(double p[], int n, double x, int &o){
  double s=0;
  for(int i=0; i<n; i++){
    o++;
    if(pow(x, n-i-1)<p[i])
      o+=pow(x, n-i-1);
    else
     o+=p[i];
    s=s+p[i]*pow(x, n-i-1);
  }
  return s;
}
int derivate(double p[], int n){
  for(int i=0; i<n; i++)
    p[i]=p[i]*(n-i-1);
  n--;
  return n;
}
void printFcn(double p[], int n){
  for(int i=0; i<n; i++){
    if(p[i]!=0){
      cout<<p[i];
      if((n-i-1)!=0)
        cout<<"x^"<<n-i-1;
    if(i<n-1)
      cout<<" + ";
    }
  }
}
int main() {
  double p[]={7,6,-6,0,3,-4};
  int n=sizeof(p)/sizeof(double);
  double x=3;
  int o=0;
  cout<<"La funcion a resolver es: "<<endl;
  printFcn(p,n);
  cout<<endl<<endl;
  cout<<"Resultado por metodo de Horner: "<<horner(p,n,x,o)<<" con "<<o<<" operaciones"<<endl;
  o=0;
  cout<<"Resultado evaluacion normal: "<<eval(p,n,x,o)<<" con "<<o<<" operaciones"<<endl<<endl;
  cout<<"Derivando se obtiene: "<<endl;
  n=derivate(p,n);
  printFcn(p,n);
  cout<<endl<<endl;
  o=0;
  cout<<"Resultado por metodo de Horner: "<<horner(p,n,x,o)<<" con "  <<o<<" operaciones"<<endl;
  o=0;
  cout<<"Resultado evaluacion normal: "<<eval(p,n,x,o)<<" con "  <<o<<" operaciones"<<endl;
  return 0;
}
```
Con lo cual se obtuvo:  
La funcion a resolver es: 7x^5 + 6x^4 + -6x^3 + 3x^1 + -4  
Resultado por metodo de Horner: 2030 con 20 operaciones  
Resultado evaluacion normal: 2030 con 12 operaciones  
  
Derivando se obtiene: 35x^4 + 24x^3 + -18x^2 + 3  
Resultado por metodo de Horner: 3324 con 16 operaciones  
Resultado evaluacion normal: 3324 con 47 operaciones 

### Punto 2
**Descripción del problema:** Se necesita un recipiente rectangular, sin tapa, de un litro de capacidad. Para construirlo se debe usar una lámina rectangular de 32cm de largo y 24 cm de ancho. El procedimiento será recortar un cuadrado idéntico en cada una de las cuatro esquinas y doblar los bordes de la lámina para formar el recipiente.

**Objetivo**: Determinar la medida del lado del cuadrado que se debe recortar en cada esquina para que el recipiente tenga la capacidad requerida. Se debe hacer uso de dos métodos distintos para resolver el problema.


------------

**Planteamiento del problema**: Se cuenta con métodos que encuentran raices de funciones para resolver el problema tales como la trisección o la cuatrisección luego, se debe proponer una función que cumpla que su raiz (x tal que f(x)=0) actue como la medida del lado del cuadrado que se debe recortar en cada esquina de la caja, a continuación se plantea la función de volumen de la caja de acuerdo al cuadrado x que será recortado:


![ecuacion](http://latex.codecogs.com/gif.latex?V_%7Bcaja%7D%3D%5Cleft%2832-2x%5Cright%29%5Ccdot%20%5Cleft%2824-2x%5Cright%29%5Ccdot%20x)


![ecuacion](http://latex.codecogs.com/gif.latex?V_%7Bcaja%7D%3D4x%5E3-112x%5E2&plus;768x%5C%3A%5C%3A%5C%3A%5Cleft%28Simplificando%5Cright%29)



Luego, para efectos de la solución del problema, se iguala a 1000 el volumen de la caja.

![ecuacion](http://latex.codecogs.com/gif.latex?V_%7Bcaja%7D%3D1000)


![ecuacion](http://latex.codecogs.com/gif.latex?4x%5E3-112x%5E2&plus;768x%3D1000)


![ecuacion](http://latex.codecogs.com/gif.latex?f%5Cleft%28x%5Cright%29%3D4x%5E3-112x%5E2&plus;768x-100%3D0%5C%3A%5Cleft%28Se%5C%3Atiene%5C%3Ala%5C%3Afuncion%5C%3Abuscada%5C%3Aigualada%5C%3Aa%5C%3Acero%5Cright%29)



Para hallar la solución se uso el método de trisección y cuatrisección (implementados en lenguaje c++) con una precisión de 10^-8:

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


Ciertamente los métodos numéricos ya han sido pensados e implementados, lo único que requiere atención es su inclusión en la resolución de los problemas, es decir, como a partir de un problema se encuentra la forma de usar un método numérico para hallar la solución.

2. ¿Que conocimientos son necesarios para formular un modelo matemático?


Conocimientos básicos de ecuaciones y de geometría como el volumen de una caja rectangular.

3. En el ejemplo de la caja ¿Cual sería la desventaja de intentar obtener experimentalmente la solución mediante prueba y error en lugar de analizar el modelo matemático?


Podría tomar mucho tiempo, más aún si se tiene en cuenta que hay tres soluciones disponibles. Por otra parte conseguir una presición adecuada en la solución a través de prueba y error sería tedioso y tardio.

4. ¿Qué es más critico: el error de truncamiento o el error de redondeo?

Cuando se redondea se trata de tener en cuenta una mayor cantidad de decimales aún sin colocarlos todos, por lo que cuando se trunca un número el error es mayor, de hecho el error de truncamiento puede ser hasta el doble del error máximo que se puede llegar a obtener redondeando.

5. ¿Cuál es la ventaja de instrumentar computacionalmente un método numérico?


Es mucho más eficiente que la computadora realice las operaciones de un método numérico, además se reducen significativamente los errores humanos en el proceso.

6. ¿Por qué es importante validar los resultados obtenidos?


Porque en muchas ocasiones a pesar de que el método de análisis numérico utilizado converge, la solución puede que no aplique para resolver el problema.


### Punto 5
**Descripción del problema:** Calcule la propagación del error dado por las operaciones aritméticas, para el siguiente problema  
**Problema:** La velocidad de una partícula es constante e igual a 4 m/s, medida con un error de 0.1 m/s durante un tiempo de recorrido de 5 seg. medido con error de 0.1 seg. Determine el error absoluto y el error relativo en el valor de la distancia recorrida.  
Se tiene:  
v = 4, Ev = 0.1 (Velocidad)  
t = 5, Et = 0.1 (Tiempo)  
d = vt (Distancia recorrida)  
**Planteamiento del problema:** Para el cálculo del error absoluto se utiliza como valor teorico v = 4 y t = 5, con lo que se obtiene d = 20  
Para hallar la solución del se utilizó el siguiente código. 
``` python
v=4;
ev=0.1;
t=5;
et=0.1;
rta=v*t;
vi=v-ev;
ti=t-et;
print('Vel Time Distance   Ea   Er')
while vi<=v+ev:
  d=round(vi*ti,2)
  ea=round(abs(d-rta),2)
  er=round(ea/rta*100,2)
  print(repr(vi).rjust(3), repr(ti).rjust(4), repr(d).rjust(8), repr(ea).ljust(4,'0'), repr(er).ljust(4,'0'))
  ti+=et
  if ti>t+et:
    ti=t-et
    vi+=ev
```
Con lo cual se obtuvo:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/error.png)

### Punto 6
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



Luego se tiene que:


![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%28n/2%5Cright%29&plus;1)


![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%28%5Cfrac%7Bn%7D%7B2%5Ek%7D%5Cright%29&plus;k%5C%3A%5Cleft%28Donde%5C%3Ak%5C%3Aes%5C%3Ael%5C%3Anumero%5C%3Ade%5C%3Aiteraciones%5Cright%29)


![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%28%5Cfrac%7Bn%7D%7B2%5E%7B%5Cleft%28%5Clog%20_2%5Cleft%28n%5Cright%29%5Cright%29%7D%7D%5Cright%29&plus;%5Clog%20%5C%3A_2%5Cleft%28n%5Cright%29%5C%3A)


![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3DT%5Cleft%281%5Cright%29&plus;%5Clog%20_2%5Cleft%28n%5Cright%29)


![ecuacion](http://latex.codecogs.com/gif.latex?T%5Cleft%28n%5Cright%29%3D1&plus;%5Clog%20_2%5Cleft%28n%5Cright%29%5C%3A%5Cleft%28Aplicando%5C%3Ael%5C%3Acaso%5C%3Abase%5C%3Aque%5C%3Adice%5C%3Aque%5C%3AT%5Cleft%281%5Cright%29%3D1%5Cright%29)

De esta manera, T(n) es de orden O(log n).

### Punto 7

**Descripción del problema**: Utilice el método de Newton para resolver el problema, muestre gráficamente cómo se comporta la convergencia a la solución. Una partícula se mueve en el espacio con el vector de posición R(t)=(2cos(t), sen(t), 0). Se requiere conocer el tiempo en el que el objeto se encuentra más cerca del punto P(2,1,0). Utilice el método de Newton con cuatro decimales de precisión.


------------

**Planteamiento del problema**: El método numérico de Newton sirve para hallar raices. El problema requiere encontrar la minima distancia que hay entre el punto P y un punto determinado de R(t).
Para ello se plantea la función d(t) que representa la distancia entre el punto P y cualquier punto de R(t):

![ecuacion](https://latex.codecogs.com/gif.latex?d%5Cleft%28t%5Cright%29%3D%5Csqrt%7B%5Cleft%282-2cos%5Cleft%28t%5Cright%29%5Cright%29%5E2&plus;%5Cleft%281-sin%5Cleft%28t%5Cright%29%5Cright%29%5E2%7D)

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

![convervengcia.p7](https://github.com/JhonnyParraB/AnalisisNumerico-1826-/blob/master/Taller%201/convergencia-p7.png)

De rojo está la función d'(t), las demás son las rectas tangentes generadas por el método de Newton. 
En la siguiente gráfica se pueden apreciar mejor las rectas tangentes y su cercania con la raiz de d'(t):

![convervengciacerca.p7](https://github.com/JhonnyParraB/AnalisisNumerico-1826-/blob/master/Taller%201/convergenciacerca-p7.png)

### Punto 11
**Descripción del problema:** Método de Muller.  
**Planteamiento del problema:** El método de Muller consiste en obtener los coeficientes de la parábola que pasa por tres puntos. Dichos coeficientes se sustituyen en la fórmula cuadratica para tener el valor donde la parabola corta con el eje x, es decir la raiz.  
Se escribe la ecuación de la parábola de la siguiente manera:  
![ecuacion](http://latex.codecogs.com/gif.latex?f%28x%29%20%3D%20a%28x-x_%7B2%7D%29%5E2&plus;b%28x-x_%7B2%7D%29%20&plus;%20c)  
Se quiere que esta parábola pase por tres puntos:  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Bx_%7B0%7D%2C%20f%28x_%7B0%7D%29%5D%2C%20%5Bx_%7B1%7D%2C%20f%28x_%7B1%7D%29%5D%2C%20%5Bx_%7B2%7D%2C%20f%28x_%7B2%7D%29%5D)  
Para determinar los coeficientes a, b y c, se sustituyen en la fórmula cuadrática. Se obtiene:  
(1) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B0%7D%29%20%3D%20a%28x_%7B0%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B0%7D-x_%7B2%7D%29%20&plus;%20c)  
(2) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B1%7D%29%20%3D%20a%28x_%7B1%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B1%7D-x_%7B2%7D%29%20&plus;%20c)  
(3) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B2%7D%29%20%3D%20a%28x_%7B2%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B2%7D-x_%7B2%7D%29%20&plus;%20c)  
Al evaluar en x2, se obtiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B2%7D%29%3Dc)  
Este valor se sustituye en las ecuaciones (1) y (2), con lo cual se obtiene  
(4) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B0%7D%29-f%28x_%7B2%7D%29%3Da%28x_%7B0%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B0%7D-x_%7B2%7D%29)  
(5) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B1%7D%29-f%28x_%7B2%7D%29%3Da%28x_%7B1%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B1%7D-x_%7B2%7D%29)  
Para calcular a y b, se establecen las siguientes relaciones:  
![ecuacion](http://latex.codecogs.com/gif.latex?h_%7B0%7D%3Dx_%7B1%7D-x_%7B0%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?h_%7B1%7D%3Dx_%7B2%7D-x_%7B1%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Cdelta%20_%7B0%7D%3D%5Ctfrac%7Bf%28x_%7B1%7D%29-f%28x_%7B0%7D%29%7D%7Bx_%7B1%7D-x_%7B0%7D%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Cdelta%20_%7B1%7D%3D%5Ctfrac%7Bf%28x_%7B2%7D%29-f%28x_%7B1%7D%29%7D%7Bx_%7B2%7D-x_%7B1%7D%7D)  
Lo anterior se remplaza en (4) y (5), y se obtiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?b%28h_%7B0%7D&plus;h_%7B1%7D%29-a%28h_%7B0%7D&plus;h_%7B1%7D%29%5E2%3Dh_%7B0%7D%5Cdelta%7B0%7D&plus;h_%7B1%7D%5Cdelta%7B1%7D)  
De lo anterior se despeja a y b. Por ende, se tiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?a%3D%5Cfrac%7B%5Cdelta_%7B1%7D-%5Cdelta_%7B0%7D%7D%7Bh_%7B1%7D&plus;h_%7B0%7D%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?b%3Dah_%7B1%7D&plus;%5Cdelta_%7B1%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?c%3Df%28x_%7B2%7D%29)  
Luego de encontrar los coeficientes, se remplazan en la ecuación cuadrática para determinar el valor de la raíz
![ecuacion](http://latex.codecogs.com/gif.latex?x_%7B3%7D%3Dx_%7B2%7D&plus;%5Cfrac%7B-2c%7D%7Bb%5Cpm%20%5Csqrt%7Bb%5E2-4ac%7D%7D)  
Para la implementación de dicho método se utilizó el siguiente código:  
``` python
import cmath
def f(x):
 return pow(x,3)-13*x-12
 #16*pow(x,4)-40*pow(x,3)+5*pow(x,2)+20*x+6
def muller(x0,x1,x2,tol,n):
  i=0
  print('Iter  X')
  while i<n:
    h1=x1-x0
    h2=x2-x1
    d1=(f(x1)-f(x0))/h1
    d2=(f(x2)-f(x1))/h2
    a=(d2-d1)/(h2+h1)
    b=d2+h2*a
    D=cmath.sqrt(b*b-4*f(x2)*a)
    if abs(b-D)<abs(b+D):
      E=b+D
    else: 
      E=b-D
    h=-2*f(x2)/E
    p=x2+h
    print(repr(i).ljust(5), p.real)
    if abs(h)<tol:
      print(f'El metodo concluyo satisfactoriamente despues de {i+1} iteraciones, solucion: {p.real}')
      return
    else:
      x0=x1
      x1=x2
      x2=p
      i+=1
  print(f'El metodo fracaso despues de {n} iteraciones')
  return


x0=float(input('Ingrese x0:'))
x1=float(input('Ingrese x1:'))
x2=float(input('Ingrese x2:'))

tol=float(input('Ingrese la tolerancia:'))
n=int(input('Ingrese número máximo de iteraciones:'))
muller(x0,x1,x2,tol,n)
```
Con lo cual se obtuvo:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/muller.png)

### Punto 13
**Descripción**: Encuentre una fórmula iterativa de convergencia cuadrática y defina un intervalo de convergencia apropiado para calcular la raiz real n-ésima de un número real. El algoritmo solamente debe incluir operaciones airtméticas elementales.

**Solución**: El siguiente es un método basado en el método de Newton que permite obtener la raiz n-esima de un número a. La solución de la siguiente ecuación igualada a 0 permite determinar la raiz n-esima del número a:


![ecuacion](http://latex.codecogs.com/gif.latex?f%5Cleft%28x%5Cright%29%3Dx%5En-a%5C%3A)

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

|  #Iteración|![ecuacion](http://latex.codecogs.com/gif.latex?%5Csqrt%5Bn%5D%7Ba%7D) |  ![ecuacion](http://latex.codecogs.com/gif.latex?f%5Cleft%28x%5Cright%29)|
| ------------ | ------------ | ------------ |
| 1 | 4.262 | 73.95429 | 
| 2 | 4.023184 | 5.986956 | 
| 3 | 4.0002 | 0.05111035 | 
| 4 | 4 | 3.825673e-06 | 

La raiz n-esima (n= 4 ) de  256  es  4  con un total de  4  iteraciones. 

Aunque el método no diverge, es importante que el número x0 sea un número positivo siempre que se quiera evaluar una raiz n-esima donde n es un número par.


### Punto 15
**Problema:** Se propone resolver la ecuación ![ecuacion](http://latex.codecogs.com/gif.latex?%5Cint_%7B0%7D%5E%7Bx%7D%20%285-e%5Eu%29du%3D2) con el método del punto fijo.  
a) Obtenga la ecuación f(x)=0 resolviendo la integral.  
b) Mediante un gráfico aproximado, o evaluando directamente, localice las raíces reales.  
c) Proponga una ecuación equivalente x=g(x) y determine el intervalo de convergencia para calcular una de las dos raíces.  
d) Del intervalo anterior, elija un valor inicial y realice 5 iteraciones. En cada iteración verifique que se cumple la condición de convergencia del punto fijo y estime el error de truncamiento en el último resultado.  
**Solución:**  
a) Al resolver la integral se obtiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?f%28x%29%3D5x-e%5Ex-1)  
b) Las raíces reales obtenidas son:
![ecuacion](http://latex.codecogs.com/gif.latex?x_%7B0%7D%3D0.54488%2C%20x_%7B1%7D%3D2.39614)  
Lo cuales se pueden observar en la siguiente gráfica:  
![Gráfica raíces reales](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/grafica_punto_fijo.png)  
Se escoge la raíz ![ecuacion](http://latex.codecogs.com/gif.latex?x_%7B0%7D%3D0.54488) para el procedimiento  
c) Para la ecuación equivalente x=g(x) se tienen las siguientes opciones:  
(1) ![ecuacion](http://latex.codecogs.com/gif.latex?x%3Dln%285x-1%29)  
(2) ![ecuacion](http://latex.codecogs.com/gif.latex?g_%7B1%7D%28x%29%3Dln%285x-1%29)  
Para elegir la ecuación a utilizar se derivan y se ve si cumple la condición de convergencia del punto fijo, es decir que sea menor que 1 en magnitud.  
(3)  ![ecuacion](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bd%20g_%7B0%7D%28x%29%7D%7Bdx%7D%3D%5Cfrac%7Be%5Ex%7D%7B5%7D)  
(4)  ![ecuacion](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bd%20g_%7B1%7D%28x%29%7D%7Bdx%7D%3D%5Cfrac%7B5%7D%7B5x-1%7D)  
Donde (3) corresponde a la derivada de (1), y (3) de (2).  
Al evaluarlas en x=0.5, se obtuvo:  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bdg_%7B0%7D%28x%29%7D%7Bdx%7D%3D0.3297%2C%20%5Cfrac%7Bdg_%7B1%7D%28x%29%7D%7Bdx%7D%3D3.3333)  
Como se observa, la única que cumple la condición de convergencia es ![ecuacion](http://latex.codecogs.com/gif.latex?g_%7B0%7D%28x%29), por lo cual es la escogida para resolver la ecuación.  
d) Para la solución se utilizó el siguiente código:
``` python
import math

def g(x):
  return ((1+math.exp(x))/5)

def error(x):
  return abs((g(x)-x)/g(x))*100

def dg(x):
  return math.exp(x)/5
  
print('Ecuación a resolver: g(x)=(1+e^x)/5 en el intervalo [0,1]')
print('Ingrese x para aproximación inicial:')
x=float(input('x='))
print('     x   g(x) Error%')
for i in range(5):
  x=round(x,4)
  e=round(error(x),4)
  if abs(dg(x))<1:
    z='Cumple criterio de convergencia del punto fijo'
  print(repr(x).ljust(6,'0'),format(g(x),'.4g'), repr(e).ljust(6,'0'), z)
  x=g(x)
```
Con lo cual se obtuvo:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/punto_fijo.png)

## Bibliografía
[Método de Muller y ejercicios](https://prezi.com/ihj_vsqouxcb/metodo-de-muller-y-ejercicios/)
