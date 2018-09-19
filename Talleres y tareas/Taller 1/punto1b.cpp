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
