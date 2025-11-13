#include <stdio.h>

extern int suma(int,int);

extern int strlenasm(char *);

extern int getBit(int,int);

int main(){

    int valor = suma(1,9);
    printf("%d\n",valor);

    valor = strlenasm("Hola mundo");
    printf("%d\n",valor);

    valor = getBit(2,1);
    printf("%d\n",valor);
    return 0;
}