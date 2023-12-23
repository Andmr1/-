%include "io64.inc"
section .bss
seed: resQ 4
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    xor rcx, rcx
    input_loop_start:         
      GET_DEC 8, r8           ; read the next number
      mov [seed+8*rcx], r8  ; save the number to the buffer, buffer[rcx] = rax;
      add rcx, 1              
      cmp rcx, 4             
      jl input_loop_start     
      xor rcx,rcx
    generation_loop:
      mov r8, [seed]
      mov r9, [seed]
      shl r9, 11
      xor r8, r9
      xor r9, r9
      mov r10, [seed+8]
      mov [seed], r10
      mov r10, [seed+16]
      mov [seed+8], r10
      mov r10, [seed+24]
      mov[seed+16], r10
      xor r10, r10
      mov r10, r8
      shr r10, 8
      xor r8, r10
      xor r10, r10
      mov r9, [seed+24]
      mov r10, r9
      shr r10, 19
      xor r9, r10
      xor r10, r10
      xor r9, r8
      mov [seed+24], r9
      PRINT_DEC 8, r9
      NEWLINE
      xor r8, r8
      xor r9, r9
      add rcx, 1
      cmp rcx, 100
      jl generation_loop 
    end:             
      xor rax, rax
      ret