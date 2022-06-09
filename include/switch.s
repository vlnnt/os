[bits 16]
_switchtopm_:                   ; switch_to_pm
    cli                         ; disable interrupts
    lgdt [_gdtdesc_]            ; load the GDT descriptor
    mov eax, cr0
    or eax, 0x1                 ; set 32-bit mode bit in cr0
    mov cr0, eax
    jmp _codeseg_:_initpm_

[bits 32]
_initpm_:                       
    mov ax, _dataseg_           ; update the segment registers
    mov ds, ax                  ; zeroing the registers
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    call _beginpm_              
