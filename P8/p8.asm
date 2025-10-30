%include "../LIB/pc_iox.inc"

section .data

	wrng db "Caracter fuera del rango",0
    big db "Tu caracter es mayor a m",0
    smol db "Tu caracter es menor a m",0
    eql db "Tu caracter es igual a m",0
    isNum db "Tu caracter es un numero",0
    isLetter db "Tu caracter es una letra mayuscula"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    ;inciso a

	call getche
    push ax
    mov al,10					;cambio de linea
	call putchar
    pop ax
    cmp al,'a'
    jl incorrecto   ;checar que no sea menor a 'a'
    cmp al,'z'
    jg incorrecto   ;checar que no sea mayor a 'z'
    cmp al,'m'
    jl menor
    cmp al,'m'
    je igual
    jmp mayor

incorrecto:
    mov edx,wrng
    call puts
    mov al,10					;cambio de linea
	call putchar
    jmp nxt

igual:
    mov edx,eql
    call puts
    mov al,10					;cambio de linea
	call putchar
    jmp nxt

mayor:
    mov edx,big
    call puts
    mov al,10					;cambio de linea
	call putchar
    jmp nxt

menor:
    mov edx,smol
    call puts
    mov al,10					;cambio de linea
	call putchar

nxt:
	;inciso b
    call getche
    push ax
    mov al,10					;cambio de linea
	call putchar
    pop ax

    ;comparacion menor a 0 y mayor a 9
    cmp al,'0'
    jl notNumber
    cmp al,'9'
    jg notNumber

    ;si pasa por aqui significa que si esta entre el rango de 0 a 9
    mov edx,isNum
    jmp nxt2


notNumber:
    cmp al,'A'
    jl notLetter
    cmp al,'Z'
    jg notLetter

    ;si pasa por aqui significa que esta entre el rango de A a Z  
    mov edx,isLetter
    jmp nxt2

notLetter:
    ;si se encuentra aqui no esta en ambos rangos de 0 a 9 y de A a Z 
    mov edx,wrng

nxt2:
    call puts
    mov al,10					;cambio de linea
	call putchar

    ;inciso c
    mov cx,3
    cmp cx,0
    jz nxt3                     ;solo se va imprimir un salto de linea indicando que se imprimio una torre de 0 asteriskos
    jl fueraRango
    cmp cx,10
    jg fueraRango


    ;si llega aqui significa que el valor ingresado si esta en el rango de 1 a 10
asteriskoColumna: 
    push cx
asteriskoRenglon:
    mov al,'*'
    call putchar
    loop asteriskoRenglon
    pop cx
    mov al,10					;cambio de linea
	call putchar
    loop asteriskoColumna
    jmp nxt3

fueraRango:
    mov edx,wrng
    call puts

nxt3:
    mov al,10					;cambio de linea
	call putchar

    ;inciso d
    


    mov ebx,0
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

