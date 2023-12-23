%include "io64.inc"
section .rodata
type: dd "%d", 0
section .text
extern malloc
extern free
extern scanf
extern printf
global main
main:
    mov rbp, rsp; for correct debugging
    push rbx
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov rcx, 16
    call malloc
    mov rbx, rax
    mov r12, 0
    input_loop_start:
       lea rdx, [rbx + 4 * r12]
       lea rcx, type
       call scanf
       add r12, 1
       cmp r12, 4
       jl input_loop_start
    xor r12, r12
    generation_loop:
    mov r13d, dword[rbx]
    mov r14d, dword[rbx]
    shl r14d, 11
    xor r13d, r14d
    mov r14d, dword[rbx + 4]
    mov dword[rbx], r14d
    mov r14d, dword[rbx + 8]
    mov dword[rbx + 4], r14d
    mov r14d, dword[rbx + 12]
    mov dword[rbx + 8], r14d
    mov r14d, r13d
    shr r14d, 8
    xor r13d, r14d
    mov r15d, dword[rbx+12]
    mov r14d, r15d
    shr r14d, 19
    xor r15d, r14d
    xor r15d, r13d
    mov dword[rbx+12], r15d
    lea rcx, [type]
    mov edx, r15d
    call printf
    NEWLINE
    xor r13d, r13d
    xor r15d, r15d
    add r12, 1
    cmp r12, 100
    jl generation_loop
    mov rcx, rbx
    call free
    leave
    pop rbx
    xor rax, rax
    ret