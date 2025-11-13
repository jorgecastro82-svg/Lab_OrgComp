#include <stdio.h>

extern int suma(int,int);

extern int strlen(char *);

extern int getBit(int,int);

int main(){

    int valor = suma(1,9);
    printf("%d\n",valor);

    valor = strlen("Hola mundo");
    printf("%d\n",valor);

    valor = getBit(14,0);
    printf("%d\n",valor);
    return 0;
}