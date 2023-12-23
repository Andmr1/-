%include "io64.inc"
%include "io64_float.inc"
section .data
x: dd 1.05
accuracy: dd 0.01
power: dd 2
factor: dd 2.0
sign: dd 0
one: dd 1.0
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    mov rcx, 1
    cvtsi2ss xmm0, rcx
    mov rbx, 2; POWER
    mov r9, 2; POWER
    mov rdx, 0; SIGN
    mov r8, [x];X
    movss xmm1, [x]
    movss xmm2, [one]
    mov r10, 2; FACTORIAL
    movss xmm4, [accuracy]
    movss xmm5, [one]
    movss xmm6, [factor]
    movss xmm9, [factor]
    loop_start:
       power_loop_start:
         sub r9, 1
         mulss xmm2, xmm1
         cmp r9, 0
         ja power_loop_start
       add rbx, 2
       mov r9, rbx
       movss xmm7, xmm6
       movss xmm8, xmm6
       factorial_loop_start:
          subss xmm8, xmm5
          mulss xmm7, xmm8
          comiss xmm8, xmm5
          ja factorial_loop_start
       addss xmm6, xmm9
       movss xmm3, xmm7
       divss xmm2, xmm3
       comiss xmm2, XMM4
       jb end
       cmp rdx, 0
       je sb
       sm:
       addss xmm0, xmm2
       mov rdx, 0
       jmp loop_end
       sb:
       subss xmm0, xmm2
       mov rdx, 1
       jmp loop_end
       loop_end:
       cvtsi2ss xmm2, rcx
       jmp loop_start
    end:
    PRINT_FLOAT xmm0                         
    xor rax, rax
    ret