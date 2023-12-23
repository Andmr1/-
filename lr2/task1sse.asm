%include "io64.inc"
%include "io64_float.inc"
section .bss
result: resd 1 
section .text
global main
set_round_up:
    sub rsp, 8
    STMXCSR [rsp]
    mov al, [rsp+1]
    and al, 0x9F
    or al, 0x40
    mov [rsp+1], al
    LDMXCSR [rsp]
    add rsp, 8
    ret
set_round_down:
    sub rsp, 8
    STMXCSR [rsp]
    mov al, [rsp+1]
    and al, 0x9F
    or al, 0x20
    mov [rsp+1], al
    LDMXCSR [rsp]
    add rsp, 8
    ret
main:
    call set_round_up
    READ_FLOAT xmm0
    cvtss2si eax, xmm0
    PRINT_DEC 4, eax
    xor rax, rax
    ret