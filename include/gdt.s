
_gdtstart_:                         
    dd 0x0
    dd 0x0

_gdtcode_:                          
    dw 0xffff
    dw 0x0       
    db 0x0       
    db 10011010b
    db 11001111b 
    db 0x0 

_gdtdata_:                          
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

_gdtend_:                           

_gdtdesc_:                          
    dw _gdtend_ - _gdtstart_ - 1
    dd _gdtstart_

_codeseg_ equ _gdtcode_ - _gdtstart_  
_dataseg_ equ _gdtdata_ - _gdtstart_