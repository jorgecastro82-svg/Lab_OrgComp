extern putchar

global pBin8b
global pBin16b
global pBin32b
global pBin64b

section .text

myPutchar:
    push edx
    push ecx
    push eax
    call putchar
    pop eax
    pop ecx
    pop edx
    ret

pBin8b:
    push ebp
    mov ebp,esp
    
    mov al,[ebp + 8]

    mov ecx,8
despliegue:
    rol al,1
    push eax
    and al,1b
    add al,'0'
    call myPutchar
    pop eax
    loop despliegue

    pop ebp
    ret

pBin16b:
    push ebp
    mov ebp,esp

    mov ax,[ebp+8]

    mov ecx,16
despliegue2:
    rol ax,1
    push ax
    and ax,1b
    add al,'0'
    call myPutchar
    pop ax
    loop despliegue2

    pop ebp
    ret

pBin32b:
    push ebp
    mov ebp,esp

    mov eax,[ebp+8]

    mov ecx,32
despliegue3:
    rol eax,1
    push eax
    and eax,1b
    add al,'0'
    call myPutchar
    pop eax
    loop despliegue3

    pop ebp
    ret

pBin64b:
    push ebp
    mov ebp,esp

    mov eax,[ebp+8]
    mov edx,[ebp+12]

    mov ecx,32
despliegue4:
    rol edx,1
    push eax
    mov eax,edx
    and eax,1b
    add al,'0'
    call myPutchar
    pop eax
    loop despliegue4

    mov ecx,32
despliegue5:
    rol eax,1
    push eax
    and eax,1b
    add al,'0'
    call myPutchar
    pop eax
    loop despliegue5

    pop ebp
    ret




