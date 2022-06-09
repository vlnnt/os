[bits 32]

_videomemory_ equ 0xb8000
_whiteblack_ equ 0x0f           ; the color byte for each character

_ourstrpm_:           
    pusha
    mov edx, _videomemory_

_outstrpmloop_:       
    mov al, [ebx]
    mov ah, _whiteblack_

    cmp al, 0
    je _outstrpmdone_

    mov [edx], ax
    add ebx, 1
    add edx, 2

    jmp _outstrpmloop_

_outstrpmdone_:       
    popa
    ret
