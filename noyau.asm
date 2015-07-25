[BITS 32]
[ORG 0x0]

    mov byte [0xB8000], '<'
    mov byte [0xB8001], 0x57
    mov byte [0xB8002], '3'
    mov byte [0xB8003], 0x0A

end:
    jmp end
