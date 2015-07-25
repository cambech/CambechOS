%define BASE  0x4
%define KSIZE 1

[BITS 16]
[ORG 0x0]

; initialisation des segments en 0x07C0
    mov ax, 0x07C0
    mov ds, ax
    mov es, ax
    mov ax, 0x9000  ; stack
    mov ss, ax
    mov sp, 0xf000

; charger le noyau
    xor ax, ax
    int 0x13

    push es
    mov ax, BASE
    mov es, ax
    mov bx, 0

    mov ah, 2
    mov al, KSIZE
    mov ch, 0
    mov cl, 2
    mov dh, 0
    int 0x13
    pop es

; gdt
    ;calcule de la limite
    mov ax, gdtend
    sub ax, gdt
    mov word [gdtptr], ax

    ;calcule l'adresse lineaire
    xor eax, eax
    xor ebx, ebx
    mov ax, ds
    mov ecx, eax
    shl ecx, 4
    mov bx, gdt
    add ecx, ebx
    mov dword [gdtptr+2], ecx

    ;chargement de la gdt
    cli
    lgdt [gdtptr]

;passage en mode protége
    mov eax, cr0
    or ax,   1
    mov cr0, eax

;nettoyage des segment de donnée avec un saut
    jmp sdd

sdd:
    mov ax,  0x10
    mov ds,  ax
    mov fs,  ax
    mov gs,  ax
    mov es,  ax

    mov ss,  ax
    mov esp, 0x9F000

; saut vers le noyau et reinitialise du segment de code
    jmp dword 0x8:BASE * 0x10

;------------------------------------------------
bootdrv:
    db 0
;------------------------------------------------
gdt:
    db 0, 0, 0, 0, 0, 0, 0, 0
gdt_cs:
    db 0xFF, 0xFF, 0x0, 0x0, 0x0, 10011011b, 11011111b, 0x0
gdt_ds:
    db 0xFF, 0xFF, 0x0, 0x0, 0x0, 10010011b, 11011111b, 0x0
gdtend:
;------------------------------------------------
gdtptr:
    dw 0  ; limite
    dd 0  ; base
;------------------------------------------------

;; NOP jusqu'a 510
times 510-($-$$) db 144
dw 0xAA55
