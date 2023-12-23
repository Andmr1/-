section .rodata
section .text
extern _ZN6medium4var46accessEshNS0_1SE
global main
main:
    push rbx
    push rbp
    mov rbp, rsp
    sub rsp, 40
    mov rcx, 1
    mov rdx, 150
    mov r8d, 431
    sal r8, 0x20
    mov r8d, 0xfffffff0
    call _ZN6medium4var46accessEshNS0_1SE
    leave
    pop rbx
    xor rax, rax
    ret