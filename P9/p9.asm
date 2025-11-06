%include "../LIB/pc_iox.inc"

N equ 10 ; constante definida

section .data

    array1 db 1,2,3,4,5,6,7,8,9,10
    array2 db 9,8,7,6,5,4,3,2,1,0

section .text

global _start:

_start:

    ;impresion arreglo 1
    mov ecx,N 
    mov ebx,array1
    call printArrayHex
    call line_fit

    ;captura arreglo (en el 1)
    mov ecx,N 
    mov ebx,array1
    call inpArray
    call line_fit

    ;impresion arreglo 1 con datos capturados
    mov ecx,N 
    mov ebx,array1
    call printArrayHex
    call line_fit

    ;impresion suma de arreglos
    mov ecx,N 
    mov ebx,array1
    mov edx,array2
    call vectorSum

    mov ecx,N 
    mov ebx,array1
    call printArrayHex
    call line_fit

    ;salida del sistema
    mov eax,1
    xor ebx,ebx
    int 80h

line_fit:
    push eax
    mov al,10
    call putchar
    pop eax
    ret

printArrayHex:          ;se ocupa que la direccion del vector este en ebx y ecx tener el valor de N
    cmp ecx,10          
    jg exit             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit             ;caso de que sea menor a 10
    jz exit             ;caso de que sea 0
print:
    mov edi,N 
    sub edi,ecx         
    mov al,[ebx+edi]
    call pHex_b
    call line_fit
    loop print
exit:
    ret

capturarArreglo:
    ;validacion de ecx
    cmp ecx,10          
    jg exit2             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit2             ;caso de que sea menor a 10
    jz exit2             ;caso de que sea 0

inpArray:
    ;pedir y validacion
    call getch            
    cmp al,'0'
    jl inpArray
    cmp al,'9'
    jg inpArray

    ;si paso por aqui esta en el rango de 0-9 ascii
    call putchar        ;impresion del valor
    call line_fit
    sub al,'0'          ;conversion de ascii a numerico
    mov edi,N           ;inidice = N-ecx
    sub edi,ecx         
    mov [ebx+edi],al
    loop inpArray

    exit2:
    ret

vectorSum:
    ;validacion de ecx
    cmp ecx,10          
    jg exit3             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit3             ;caso de que sea menor a 10
    jz exit3             ;caso de que sea 0
    ;si pasa por aqui ecx es valido

suma:
    mov edi,N           
    sub edi,ecx     ;inidice = N-ecx
    ;ebx es la direccion del primer arreglo y edx la del segundo, resultado se guardara en el primer arreglo
    mov al,[ebx+edi]
    add al,[edx+edi]
    mov [ebx+edi],al

    loop suma
exit3:
    ret