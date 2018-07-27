
# Descripción

A partir de la comprensión del método cerrado de bisección que está basado en el "Teorema de valores intermedios", construir dos algoritmos uno que particione en tres, al que llamaremos "trisección" y otro que particione en cuatro al que llamaremos "cuatrisección" de tal forma que cumplan el mismo objetivo que el método de bisección.

La función que será utilizada para realizar la aproximación saldrá del siguiente ejercicio:

> Utilizar el método gráfico y de bisección  para determinar el coeficiente de arrastre c necesario para que un paracaidista de  masa m = 68.1 kg tenga  una  velocidad de 40 m/s después de  una caída libre de t = 10 s. Nota: La aceleración de la gravedad es 9.8 m/s2. 


# Bisección
Para comprender el algoritmo de trisección y cuatrisección es necesario hacer un pequeño resumen de lo que el método de bisección representa:

> El método de bisección, conocido también como de corte binario, de partición de intervalos o de Bolzano, es un tipo de búsqueda incremental en el que el intervalo se divide siempre a la mitad. Si la función cambia de signo sobre un intervalo, se evalúa el valor de la función en el punto medio. La posición de la raíz se determina situándola en el punto medio del subintervalo, dentro del cual ocurre un cambio de signo. El proceso se repite hasta obtener una mejor aproximación.

# La función y gráfica del ejercicio
Cuando se desarrolla el ejercicio propuesto resulta la siguiente función f(x) donde la raiz representa el coeficiente de arrastre c:

`f(x)=(667.8/x)*(1-e^(-0.146843x))-40`

Junto con su correspondiente gráfica en los ejes coordenados x,y:

![save 2](https://user-images.githubusercontent.com/41595878/43305493-9d3cae82-913d-11e8-8f09-b7b47cf117a8.png)


# Trisección
Lo primero que se debe tener claro es que, a diferencia del método de bisección, el de trisección debe dividir el intervalo en tres partes. Partiendo de que se tiene un intervalo [a, b] en el que la función f(c) arriba expresada es continua, se propuso colocar dos puntos en medio del intervalo a los que llamaremos c y d 
Ahora, para realizar la trisección se le debe dar un valor a c y a d como los nuevos puntos medios, si lo analizamos quedarian así:

`c=a+(b-a)*1/3`,
`d=a+(b-a)*2/3`


Realizamos la primera aproximación con f(c) y f(d) a la raiz de la función. Luego, en caso de que las raices c o d no sean satisfactorias con la precisión elegida se continua particionando el intervalo que cumpla la condición de que la multiplicacion de sus imagenes es negativa.

He aquí el algoritmo escrito en lenguaje c++ para la trisección:

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
            c=(2*b+a)/3;
            d=(b+2*a)/3;   
            
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
        return (667.38/x)*(1- pow(2.71828182, (-0.146843*x)))-40;
    }
        

Para efectos del ejercicio, se uso como entrada el intervalo [10, 20] que cumple con la condición de continuidad y de `f(a)*f(b)<0` y se establecio una precisión de `10e-8`. Los resultados se muestran en la siguiente tabla:

|  #Iteración |c   |f(c)   |d   |f(d)   |
| ------------ | ------------ | ------------ | ------------ | ------------ |
|1|16.66666667|-3.42169042|13.33333333|2.98826857|
|2|14.44444444|0.66328796|15.55555556|-1.46680033|
|3|15.18518519|-0.77716190|14.81481481|-0.06737520|
|4|14.93827160|-0.30625382|14.69135802|0.17382278|
|5|14.77366255|0.01276506|14.85596708|-0.14725776|
|6|14.82853224|-0.09403130|14.80109739|-0.04069046|
|7|14.81024234|-0.05848347|14.79195245|-0.02288471|
|8|14.79804908|-0.03475663|14.78585581|-0.01100713|
|9|14.78992024|-0.01892615|14.78179139|-0.00308559|
|10|14.78450101|-0.00836690|14.77908178|0.00219684|
|11|14.78088819|-0.00132490|14.78269460|-0.00484615|
|12|14.78028605|-0.00015104|14.78149033|-0.00249871|
|13|14.77988463|0.00063156|14.78068748|-0.00093362|
|14|14.78041986|-0.00041191|14.78015224|0.00010982|
|15|14.78024145|-0.00006409|14.78033066|-0.00023800|
|16|14.78021171|-0.00000612|14.78027118|-0.00012206|
|17|14.78019189|0.00003253|14.78023154|-0.00004477|
|18|14.78021832|-0.00001900|14.78020511|0.00000676|
|19|14.78020951|-0.00000183|14.78021392|-0.00001041|
|20|14.78020804|0.00000104|14.78021098|-0.00000469|
|21|14.78021000|-0.00000278|14.78020902|-0.00000087|
|22|14.78020935|-0.00000151|14.78020870|-0.00000023|
|23|14.78020891|-0.00000066|14.78020848|0.00000019|
|24|14.78020862|-0.00000009|14.78020877|-0.00000038|
|25|14.78020858|0.00000000|

Luego la raiz sería 14.78020858 y se encontraría después de 25 iteraciones.

# Cuatrisección
La cuatrisección de hecho no sería muy diferente a la trisección, ahora tendriamos tres puntos intermedios en vez de dos, a los que llamaremos c, d y e que tienen las siguientes definiciones:
`c=a+(a-b)*1/4`,
`d=a+(a-b)*2/4`,
`e=a+(a-b)*3/4`,

El algoritmo propuesto, escrito en c++ es el siguiente:

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
        return (667.38/x)*(1- pow(2.71828182, (-0.146843*x)))-40;
    }
        


Teniendo los mismos datos de entrada que la trisección (intervalo [10,20]) y la misma precisión el resultado es el siguiente:

| #Iteración  |c  |f(c)   |d   |f(d)  |e   |f(e)   |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|1|12.50000000|4.87315050|15.00000000|-0.42483192|17.50000000|-4.78348207|
|2|13.12500000|3.44765648|13.75000000|2.09221131|14.37500000|0.80267245|
|3|14.53125000|0.49012620|14.68750000|0.18139789|14.84375000|-0.12356946|
|4|14.72656250|0.10480567|14.76562500|0.02844762|14.80468750|-0.04767713|
|5|14.77539062|0.00939460|14.78515625|-0.00964386|14.79492188|-0.02866776|
|6|14.77783203|0.00463362|14.78027344|-0.00012645|14.78271484|-0.00488561|
|7|14.77844238|0.00344352|14.77905273|0.00225347|14.77966309|0.00106348|
|8|14.77981567|0.00076599|14.77996826|0.00046851|14.78012085|0.00017103|
|9|14.78015900|0.00009666|14.78019714|0.00002229|14.78023529|-0.00005208|
|10|14.78020668|0.00000370|14.78021622|-0.00001490|14.78022575|-0.00003349|
|11|14.78020906|-0.00000095|14.78021145|-0.00000560|14.78021383|-0.00001025|
|12|14.78020728|0.00000253|14.78020787|0.00000137|14.78020847|0.00000021|
|13|14.78020862|-0.00000008|14.78020877|-0.00000037|14.78020892|-0.00000066|
|14|14.78020851|0.00000014|14.78020854|0.00000006|14.78020858|-0.00000001|

De esta manera, la raiz resultante sería 14.78020858 y se encontraría después de 14 iteraciones.

# Conclusiones:
- La eficiencia del método de bisección y sus derivados dependen de que tan acotado este el intervalo.
- Entre más grande sea el número de particiones se reduce el número de iteraciones lo que podría resultar en una mejora de eficiencia en el algoritmo.

# Bibliografía
     [Burden,1998]           páginas 48-52.
