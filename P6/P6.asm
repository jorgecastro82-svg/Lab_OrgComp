%include "../LIB/pc_iox.inc"

section .data

	N dw 0

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	;inciso a

	mov ebx, 0x5C4B2A60			;valor original
	mov eax,ebx
	call pHex_dw				;despliegue valor original

	mov al,10					;cambio de linea
	call putchar

	add ebx, 0x02219157			;valor sumado con mi matricula
	mov eax,ebx
	call pHex_dw				;despliegue valor sumado con matricula	

	mov al,10					; cambio de linea
	call putchar				

	mov al,10					;cambio de linea
	call putchar

	;inciso b
	mov eax, esp
	call pHex_dw				;despliegue de la direccion de pila antes de ser modificada

	mov al,10					;cambio de linea
	call putchar

	push bx						;empujar los 16 bits menos signficativos de EBX a la pila
	mov eax, esp
	call pHex_dw					;despliegue de la direccion de pila modificada

	mov al,10					; cambio de linea
	call putchar				

	mov al,10					;cambio de linea
	call putchar

	;inciso c

	mov al, 8					;al = 8
	mul bl						;ax = bl * al
	mov [N],ax
	call pHex_w					;inpresion del resultado de [N] = bl * 8

	mov al,10					; cambio de linea
	call putchar

	mov al,10					;cambio de linea
	call putchar

	;inciso d

	inc word [N]				;N++
	mov ax,[N]
	call pHex_w					;inpresion de N incrementado

	mov al,10					; cambio de linea
	call putchar

	mov al,10					;cambio de linea
	call putchar

	;inciso e
	mov ax,bx
	mov cx,0xFF
	div cx						;DX:AX / 0xFF , donde DX = DX:AX % 0xFF y AX = DX:AX / 0xFF
	call pHex_w					;impresion del cociente

	mov al,10					; cambio de linea
	call putchar

	mov ax,dx 
	call pHex_w					;impresion del residuo

	mov al,10					; cambio de linea
	call putchar

	mov al,10					;cambio de linea
	call putchar

	;inciso f 
	add word [N],ax				;N+=residuo
	mov ax,[N]
	call pHex_w					;impresion del nuevo valor de N

	mov al,10					; cambio de linea
	call putchar

	mov al,10					;cambio de linea
	call putchar

	;inciso g
	dec word [N]				;N--
	mov ax,[N]
	call pHex_w					;impresion de N decrementado

	mov al,10					; cambio de linea
	call putchar

	pushfd						;push registro entero de EFLAGS al stack
	pop eax						;pop de EFLAGS del stack y almacenado en eax
	call pHex_dw				;impresion de las banderas

	mov al,10					; cambio de linea
	call putchar

	mov al,10					;cambio de linea
	call putchar

	;inciso h

	mov eax,esp				
	call pHex_dw				;impresion de la direccion a la que apunta ESP antes de hacer pop
	mov al,10					; cambio de linea	
	call putchar

	pop ax						;sacar un dato de 16 bits de la pila

	mov eax,esp				
	call pHex_dw				;impresion de la direccion a la que apunta ESP despues de hacer pop del dato de 16bits
	mov al,10					;cambio de linea	
	call putchar

	mov ebx,0
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel
