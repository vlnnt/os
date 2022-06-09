[bits 32]
[extern main]

call main
call _loop_

_loop_:
    jmp $
