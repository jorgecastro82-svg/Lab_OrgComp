%include "../LIB/pc_iox.inc"

extern pBin_n 
extern pBin_b  
extern pBin_w
extern pBin_dw 

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    ;inciso a
	mov eax, 0x22446688
    call pHex_dw

    mov ebx,eax         ;se copia eax a ebx ya que la funcion saltoLinea modifica el valor de eax
    call saltoLinea

    mov eax,ebx     
    mov cl,4
    ror eax,cl
    call pHex_dw
    call saltoLinea
    call saltoLinea

    ;inciso b
    mov cx,0x3F48
    mov ax,cx
    call pHex_w
    call saltoLinea

    mov al, 3
    shl cx,3
    mov ax,cx
    call pHex_w
    call saltoLinea
    call saltoLinea

    ;inciso c
    mov esi,0x20D685F3 
    mov eax,esi 
    call pHex_dw
    call saltoLinea
    ;(0010-0000-1101-0110-1000-0101-1111-0011)
    ;(0100-0000-0000-0100-0010-0000-0010-0001) se usa xor ya que es su funcion principal la de invertir
    ;se pasa a hexadecimal
    ;(40042021)
    mov eax,esi
    call pBin_dw
    call saltoLinea
    xor esi,0x40042021
    mov eax,esi
    call pBin_dw
    call saltoLinea
    call saltoLinea

    ;inciso d
    push esi

    ;inciso e
    mov ch,0xA7
    mov al,ch
    call pHex_b
    call pBin_b
    call saltoLinea

    xor ebx,ebx
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

saltoLinea:
    mov al,10	; cambio de linea
	call putchar
    ret