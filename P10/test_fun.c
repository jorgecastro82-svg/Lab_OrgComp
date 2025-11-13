#include <stdio.h>

extern int suma(int,int);

extern int strlenasm(char *);

extern int getBit(int,int);

int main(){

    int valor = suma(11,22);
    printf("%d\n",valor);

    valor = strlenasm("longitud 11");
    printf("%d\n",valor);

    valor = getBit(10,3);
    printf("%d\n",valor);
    return 0;
}