;gcc -m32

global suma
global strlenasm
global getBit

section .text

suma:
    push ebp
    mov ebp,esp
    mov eax,[ebp+8]
    add eax,[ebp + 12]
    pop ebp
    ret

strlenasm:
    push ebp
    mov ebp,esp
    mov ecx,0
    mov eax,[ebp + 8]
ciclo:
    cmp byte [eax],0
    je exit
    inc ecx
    add eax,1
    jmp ciclo
exit:
    mov eax,ecx
    pop ebp
    ret

getBit:
    push ebp
    mov ebp,esp
    mov cl,[ebp + 12]
    inc cl
    mov eax,[ebp + 8]
    ror eax,cl
    rol eax,1
    and eax,1h
    pop ebp
    ret