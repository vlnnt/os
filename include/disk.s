_diskload_:
    pusha
    push dx

    mov ah, 0x02
    mov al, dh          ; number of sectors to read (1-128)
    mov cl, 0x02        ; sector number (1-17)
    mov ch, 0x00        ; cylinder number (0-1023)
    mov dh, 0x00        ; head number (0-15)
  
    int 0x13
    jc _diskerror_

    pop dx
    cmp al, dh
    
    jne _sectorserror_
    popa
    ret

_diskerror_:
    mov bx, _diskerrorhandler_
    call _out_
    call _out_newline_
    mov dh, ah
    call _outhex_
    jmp _diskloop_

_sectorserror_:
    mov bx, _sectorserrorhandler_
    call _out_

_diskloop_:
    jmp $

_diskerrorhandler_: db "Disk read error!", 0
_sectorserrorhandler_: db "Incorrect number of sectors read!", 0