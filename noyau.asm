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

4096ko
8192
16384

4194304ko
1024
4Go

1024 = 1048576 page = 1048576 * 4096 = 4go 294mo 967ko 296o
1dir =    1024 page =    1024 * 4096 =       4mo 194ko 304o 
             1 page =       1 * 4096               4ko 096o

1octet = 0x00 à 0xFF = 0000 0000 à 1111 1111 = 0 à 255 

