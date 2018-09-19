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
