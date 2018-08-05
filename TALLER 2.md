## Taller 1- Parejas

Punto número 2:

Con trisección:

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
   
    cout<<endl<<"La raiz es: "<<raiz;  
    return 0;
}

double f (double x){
    return 768*x-112*pow (x, 2)+4*pow (x,3)-1000;
}

Con cuatrisección:


'/*Cuatrisección
 *Hecho por Jhonny Alexander Parra 
 *2018
*/

#include <iostream>
#include<stdio.h>
#include<cmath>
#include <iomanip> 

using namespace std;
'
double f (double x);
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
    
    cout<<endl<<"La raiz es: "<<raiz;    
    return 0;
}

double f (double x){
    return 768*x-112*pow (x, 2)+4*pow (x,3)-1000;
}'





// Example program
#include <iostream>
#include <string>

using namespace std;

int main()
{
    int n;
    int d;
    cin>>n;
    while (n>0){
        d=n%2;
        n=n/2; 
        cout<<d<<endl;
    }
    
    //T(n)=1+T(n/2)
    //O(log2(n))
    
}


Punto Newton Raphson:




evaluarFuncion<-function(f, x){
  eval(f)
}


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







NewtonRaphson(D(expression(sqrt((2-2*cos(x))^2+(1-sin(x))^2)), "x"), 30, 0.01)
