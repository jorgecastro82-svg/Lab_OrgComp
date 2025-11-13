%include "../LIB/pc_iox.inc"

N equ 10 ; constante definida

section .data

    array1 db 1,2,3,4,5,6,7,8,9,10
    array2 db 9,8,7,6,5,4,3,2,1,0

section .text

global _start:

_start:

    ;captura arreglo (en el 1)
    mov ecx,N 
    mov ebx,array1
    call capturarArreglo
    call line_fit

    ;captura arreglo (en el 2)
    mov ebx,array2
    call capturarArreglo
    call line_fit

    ;impresion producto punto
    mov ebx,array1
    mov edx,array2
    call productoEscalar

    ;impresion suma de arreglos
    call vectorSum
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
    push ecx
    push edi
    push eax
    cmp ecx,10          
    jg exit             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit             ;caso de que sea menor a 10
    jz exit             ;caso de que sea 0

    mov edi,0
print:        
    mov al,[ebx+edi]
    call pHex_b
    call line_fit
    inc edi
    loop print
exit:
    pop eax
    pop edi
    pop ecx
    ret

capturarArreglo:
    ;validacion de ecx
    push ecx
    push eax
    push edi
    cmp ecx,10          
    jg exit2             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit2             ;caso de que sea menor a 10
    jz exit2             ;caso de que sea 0

    mov edi,ebx
inpArray:
    ;pedir y validacion
    call getch            
    cmp al,'0'
    jl inpArray
    cmp al,'9'
    jg inpArray
    ;si paso por aqui esta en el rango de 0-9 ascii
    call putchar        ;impresion del valor
    sub al,'0'          ;conversion de ascii a numerico
    mov [edi],al
    inc edi
    call line_fit
    loop inpArray

    exit2:
    pop edi
    pop eax
    pop ecx
    ret

vectorSum:
    ;validacion de ecx
    push ecx
    push edi
    push eax
    cmp ecx,10          
    jg exit3             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit3             ;caso de que sea menor a 10
    jz exit3             ;caso de que sea 0
    ;si pasa por aqui ecx es valido

    mov edi,0
suma:
    ;ebx es la direccion del primer arreglo y edx la del segundo, resultado se guardara en el primer arreglo
    mov al,[ebx+edi]
    add al,[edx+edi]
    mov [ebx+edi],al
    inc edi
    loop suma
exit3:
    pop eax
    pop edi
    pop ecx
    ret

productoEscalar:
    ;validacion de ecx
    push ecx
    push edi
    push eax
    push esi
    cmp ecx,10          
    jg exit4             ;ecx depende como maximo tiene que ser 10
    cmp ecx,0
    jl exit4             ;caso de que sea menor a 10
    jz exit4             ;caso de que sea 0
    ;si pasa por aqui ecx es valido

    mov edi,0
    mov esi,0
    mov eax,0
producto:
    ;ebx es la direccion del primer arreglo y edx la del segundo, resultado se guardara en ax
    mov al,[ebx+edi]
    mul byte [edx+edi]
    add si,ax
    inc edi
    loop producto

    mov eax,0
    mov ax,si
    call pHex_w
    call line_fit
    call line_fit
exit4:
    pop esi
    pop eax
    pop edi
    pop ecx
    ret