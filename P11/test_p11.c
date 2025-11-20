#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t dato);
extern void pBin16b(uint16_t dato);
extern void pBin32b(uint32_t dato);
extern void pBin64b(uint64_t dato);

int main(){

    pBin8b(2);
    printf("\n");

    pBin16b(2);
    printf("\n");

    pBin32b(2);
    printf("\n");

    pBin64b(2);
    printf("\n");

    return 0;
}