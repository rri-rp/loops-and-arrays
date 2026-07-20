section .text
    global _start

_start:
    ; Counter using EBX and the optimized LOOP instruction
    mov ecx, 10
    mov ebx, 0

counter:
    inc ebx
    loop counter

    mov [counter_result], ebx

    ; Calculate Fibonacci result
    mov ecx, 10
    mov eax, 0
    mov ebx, 1

fibonacci:
    add eax, ebx
    xchg eax, ebx
    loop fibonacci

    mov [fib_result], eax

    ; Find the largest element in an array of length 3
    mov eax, 3
    mov ecx, array
    mov ebx, [ecx]
    add ecx, 4
    dec eax

array_loop:
    cmp ebx, [ecx]
    jg next_element
    mov ebx, [ecx]

next_element:
    add ecx, 4
    dec eax
    jnz array_loop

    mov [largest], ebx

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    array dd 12, 45, 30

section .bss
    counter_result resd 1
    fib_result resd 1
    largest resd 1
