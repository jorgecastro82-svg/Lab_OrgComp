%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   
	mov edx, msg		; edx = dirección de la cadena msg
	mov ebx, msg		; ebx = direccion de msg
	call puts			; imprime cadena msg terminada en valor nulo (0) previo a ser modificada
	add ebx, 23					;sumarle 23 a ebx para que este en la direccion de msg + 23 (apuntando a la letra x)
	mov byte[ebx],'X'		; se mueve 'X' en la direccion con el valor de ebx, CASO INDIRECTO
	call puts			; imprime cadena msg terminada en valor nulo (0) pero ya modificada

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 


