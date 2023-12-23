section ro.data
section .text
extern _ZN4hard4var41C6accessERKNS0_1SE
global main
main:
    mov rbp, rsp; for correct debugging
;412
    push rbx
    mov rbp, rsp
    push rcx
    mov word[rbp], 41;41
    mov word[rbp+2], 412;412
    mov word[rbp+4], 3244;324
    mov dword[rdx], 41;41
    mov dword[rdx + 4],412 ;412 -4
    lea rcx, qword[rbp]
    push rdx
    call _ZN4hard4var41C6accessERKNS0_1SE
    leave
    xor rax, rax
    ret