BOOTSEG equ 0x7C00
SYSSEG equ 0x1000
INITSEG equ 0x9000

[org BOOTSEG]

    mov [_bootdrive_], dl       ; BIOS sets us the boot drive in 'dl' on boot
    mov bp, SYSSEG
    mov sp, bp

    mov bx, _msgrm_
    call _out_
    call _out_newline_

    call _loadkrnl_
    call _switchtopm_

    call _loop_

%include "../include/disk.s"
%include "../include/gdt.s"
%include "../include/out.s"
%include "../include/out32.s"
%include "../include/switch.s"

[bits 16]
_loadkrnl_:
    mov bx, _msgloadkrnl_
    call _out_
    call _out_newline_

    mov bx, SYSSEG              ; read from disk
    mov dh, 2
    mov dl, [_bootdrive_]

    call _diskload_
    ret

[bits 32]
_beginpm_:
    mov ebx, _msgpm_
    call _ourstrpm_
    call SYSSEG
    call _loop_

_bootdrive_:
    db 0
_msgrm_:
    db "Started in 16-Bit Real Mode", 0
_msgpm_:
    db "Landed in 32-Bit Protected Mode.", 0
_msgloadkrnl_:
    db "Loading kernel into memory.", 0
_loop_:
    jmp $

times 510-($-$$) db 0
dw 0xAA55