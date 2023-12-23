%include "io64.inc"
%include "io64_float.inc"
section .data
a: dd 1.0
b: dd -0.5
e: dd 2.71828182845902
section .text
global main
main:
    mov rbp, rsp; for correct debugging
fld dword [b]
fld dword[b]
fmul
fld1
fsubr
fsqrt
fld dword[b]
fdiv
fld1
fpatan
fld dword[b]
fld1
fld1
fsub
fcomip
fstp dword[rax]
jb metka
fldpi
fadd
metka:
fld dword[e]
fyl2x
fld1
fld st1
fprem
f2xm1
fadd
fscale
fstp st1
fld dword[a]
fsub 
fstp dword[rax]
PRINT_FLOAT [rax]
xor rax, rax
ret