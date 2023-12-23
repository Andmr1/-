%include "io64.inc"
%include "io64_float.inc"
section .data
x: dd 0.5
y: dd -20.0
a: dd 10.0
e: dd 2.71828182845902
section .text
global main
main:
    mov rbp, rsp; for correct debugging
;"0" - uncomplete, 1 - "complete"
    fld1
    fld dword[e]
    fyl2x
    fstp dword[rax]
    fld1
    fld dword[x]
    fsin
    fld dword[a]
    fadd
    fyl2x
    fld dword[rax]
    fdiv
    fst dword[rax]
    fld dword[rax]
    fmul
    fld dword[rax]
    fmul
    fld dword[y]
    fcomip
    jb less
    PRINT_DEC 4, 0
    jmp end
    less:
    PRINT_DEC 4, 1
    jmp end
    end:
    fstp st0
    xor rax, rax
    ret