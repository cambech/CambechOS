[BITS 16]
[ORG 0x0]


; initialisation des segments en 0x100
    mov ax, 0x100
    mov ds, ax
    mov es, ax

; initialisation du segment de pile
    mov ax, 0x9000
    mov ss, ax
    mov sp, 0xf000

end:
    jmp end
