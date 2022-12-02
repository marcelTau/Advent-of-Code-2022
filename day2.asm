%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_WRITE 1
%define SYS_EXIT 60

section .bss                  ; 
  digitSpace resb 100         ; Reserve bytes for debug print
  digitSpacePos resb 8        ; Reserve bytes for pointer into digitSpace

section .rodata
  data: db "A Y", 10, "B X", 10, "C Z", 10
  data_len: equ $ - data

section .text

; =============================================================================
; Debug print to print the value that is stored in rax
; Before Usage rax should be safed if the value has to stay the same
; =============================================================================
debug_print:
    mov rcx, digitSpace
    mov rbx, 10 ; newline
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx

_printRAXLoop:
    mov rdx, 0 ; weird concat roule

    mov rbx, 10
    div rbx

    push rax
    add rdx, 48

    mov rcx, [digitSpacePos]
    mov [rcx], dl ; move current retrieved char into digitspace
    inc rcx
    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0
    jne _printRAXLoop
    
    ; print the digitspace backwards

_printRAXLoop2:
    mov rcx, [digitSpacePos]
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall     ; write a single byte

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx

    ; keep printing until at the beginning of the digitspace
    cmp rcx, digitSpace
    jge _printRAXLoop2

    ret
; =============================================================================
; End Debug print
; =============================================================================


;section .text
global _start

;__debug_print:
    ;mov rdi, 0x1
    ;mov rsi, rax
    ;mov rax, SYS_WRITE
    ;mov rdx, 1
    ;syscall
    ;ret

_start:
    push rbp
    mov rbp, rsp

    call part1

    mov rdi, 0xb
    mov rax, 60
    syscall

part1:
    xor r8, r8      ; total 
    xor r9, r9      ; pos in string
    xor r10, r10    ; enemy move
    xor r11, r11    ; my move

loop:
    cmp r9, data_len
    jge exit

    ; get the next char of data
    mov r10b, [data + r9]

    ; add 2 to get to the next char and skip the space
    add r9, 2

    ; move that char into r11
    mov r11b, byte [data + r9]

    add r9, 2 ; skip the \n

    ;call add_to_r8
    ;jmp loop

; value should be in r11
add_to_r8:
    ; add 1 for rock
    add r8, 1

    ;push rax
    ;mov al, r11b
    ;call debug_print
    ;pop rax

    cmp r11b, 88
    je loop

    ; add 1 for paper
    add r8, 1
    cmp r11b, 89
    je loop

    ; add 1 for scissors
    add r8, 1
    ; ret
    jmp loop

exit:
    mov rax, r8
    call debug_print
    mov rdi, r8
    mov rax, 60
    syscall
