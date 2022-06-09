_out_:
    pusha

_ch_cycle_:
    mov al, [bx]                    ; passing the address of the string
    cmp al, 0             
    je _if_equal_   
    
    mov ah, 0x0e                    ; output to the screen
    int 0x10
   
    add bx, 1                       ; processing each character for output
    jmp _ch_cycle_                  ; repeat until we output the entire line

_if_equal_:
    popa
    ret

_out_newline_:
    pusha
    
    mov ah, 0x0e                    ; teletype output
    mov al, 0x0a                    ; character to write
    int 0x10

    mov al, 0x0d                    ; carriage return
    int 0x10
    
    popa
    ret

_outhex_:
    pusha
    mov cx, 0

_hexloop_:
    cmp cx, 4
    je _parameter_
        
    mov ax, dx                      ; convert last char of "dx" to ascii
    and ax, 0x000f
    add al, 0x30
    cmp al, 0x39

    jle _step_two_
    add al, 7

_step_two_:   
    mov bx, _hex_out_ + 5           ; get the correct position of the string to place our ASCII char
    sub bx, cx  
    mov [bx], al 
    ror dx, 4 
    
    add cx, 1
    jmp _hexloop_

_parameter_:
    mov bx, _hex_out_
    call _out_

    popa
    ret

_hex_out_:
    db '0x0000', 0                  ; reserve memory for our new string