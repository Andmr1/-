section .text
extern access3
global main
main:
    push rbx
    push rbp
    mov rbp, rsp
    sub rsp, 40
    mov rcx, 0
    mov r8, 0
    mov rdx, 1
    mov r9, -1
    call access3
    leave
    pop rbx
    xor rax, rax
    ret