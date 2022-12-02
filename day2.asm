; nasm -felf64 day2.asm && ld day2.o -o day2 && ./day2

%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_WRITE 1
%define SYS_EXIT 60

%define AVAL 65
%define BVAL 66
%define CVAL 67
%define XVAL 88
%define YVAL 89
%define ZVAL 90

%define ROCK 65
%define PAPER 66
%define SCISSORS 67


section .bss                  ; 
  digitSpace resb 100         ; Reserve bytes for debug print
  digitSpacePos resb 8        ; Reserve bytes for pointer into digitSpace

section .rodata
  ;data: db "A Y", 10, "B X", 10, "C Z", 10
  data: db "B Z", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "C Y", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A X", 10, "C Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "C Y", 10, "C Z", 10, "A X", 10, "C Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Z", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "C X", 10, "A X", 10, "B Z", 10, "B Y", 10, "B X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "C X", 10, "A X", 10, "B X", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Z", 10, "B X", 10, "A X", 10, "C X", 10, "B Y", 10, "A Z", 10, "C Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "B Z", 10, "C Y", 10, "B X", 10, "B X", 10, "C Z", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "B Y", 10, "B Z", 10, "B X", 10, "A X", 10, "C Y", 10, "B Z", 10, "B Y", 10, "B X", 10, "B X", 10, "A X", 10, "C Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Z", 10, "A Y", 10, "B X", 10, "A X", 10, "A Z", 10, "B X", 10, "B X", 10, "C Z", 10, "C Y", 10, "B X", 10, "B X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "A X", 10, "B Y", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Z", 10, "B X", 10, "A X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "B X", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "A Y", 10, "A X", 10, "A X", 10, "A Z", 10, "C Y", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "A X", 10, "A Y", 10, "A Y", 10, "C Z", 10, "C Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Z", 10, "C Y", 10, "C Y", 10, "C Y", 10, "C Y", 10, "C X", 10, "A X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "B Z", 10, "A Y", 10, "C X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A X", 10, "C Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "A Z", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "A X", 10, "C Y", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A Y", 10, "C X", 10, "B X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Y", 10, "C Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "A X", 10, "C Y", 10, "A X", 10, "C X", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "B X", 10, "A Y", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "C X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Z", 10, "A X", 10, "B X", 10, "B X", 10, "C X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Z", 10, "C Y", 10, "B Z", 10, "C Y", 10, "C X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B Z", 10, "B Z", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Z", 10, "C Y", 10, "C Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "C Z", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "A Z", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "C Z", 10, "A X", 10, "C X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "B X", 10, "C Z", 10, "C Y", 10, "A Z", 10, "B Z", 10, "C X", 10, "A Y", 10, "A Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "C Z", 10, "A Y", 10, "C Y", 10, "A X", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "C Z", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "A Y", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "C Z", 10, "A X", 10, "A Z", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "C Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "A X", 10, "A Z", 10, "B X", 10, "B X", 10, "C Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Z", 10, "A Y", 10, "C Z", 10, "B Z", 10, "A Y", 10, "C Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "B Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Z", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "C X", 10, "C Z", 10, "A X", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "C X", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "C X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "A Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "B Z", 10, "B X", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "C Y", 10, "C Z", 10, "A X", 10, "B X", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "C X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "B Y", 10, "A X", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "C X", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Z", 10, "A X", 10, "C X", 10, "B Z", 10, "B X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "A Y", 10, "A Y", 10, "B Y", 10, "B X", 10, "B Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "B Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "A Z", 10, "A X", 10, "A X", 10, "B X", 10, "B X", 10, "A Z", 10, "B X", 10, "A X", 10, "A Z", 10, "A X", 10, "A Z", 10, "A Y", 10, "A X", 10, "A Z", 10, "C X", 10, "A X", 10, "C Y", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "B X", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "B Z", 10, "C Y", 10, "B Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "C Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "C Z", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "C X", 10, "C Y", 10, "A Z", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "A Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "B Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Z", 10, "B Z", 10, "C Z", 10, "B Z", 10, "A Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Z", 10, "A Z", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "C Z", 10, "A Z", 10, "B X", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C X", 10, "A Y", 10, "A X", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Z", 10, "A Z", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "C Z", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C X", 10, "A Z", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B X", 10, "C Y", 10, "A X", 10, "A Z", 10, "B Z", 10, "C Y", 10, "A Z", 10, "A X", 10, "A Z", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "A Z", 10, "B Z", 10, "A X", 10, "A X", 10, "C Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B X", 10, "A X", 10, "C X", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C Y", 10, "C Y", 10, "B X", 10, "A Z", 10, "A Y", 10, "C Y", 10, "B X", 10, "B Z", 10, "B X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Z", 10, "B X", 10, "A X", 10, "C Z", 10, "B X", 10, "B X", 10, "B X", 10, "C X", 10, "C Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "C Y", 10, "C X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "C Z", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A Y", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "C Y", 10, "A X", 10, "A X", 10, "B Y", 10, "B X", 10, "A Y", 10, "C X", 10, "B Z", 10, "B Z", 10, "A Y", 10, "C Z", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "C Z", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Z", 10, "B X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "B Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "C Y", 10, "A Y", 10, "C X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "B X", 10, "C Y", 10, "A Z", 10, "A X", 10, "B Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A Y", 10, "A Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "C X", 10, "A X", 10, "C Z", 10, "B X", 10, "C X", 10, "B Z", 10, "B Z", 10, "A Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "C Z", 10, "C Y", 10, "A Y", 10, "C Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "B X", 10, "C Z", 10, "B Z", 10, "C Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C X", 10, "A Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "B Z", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "C Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A X", 10, "C Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "C Y", 10, "A Z", 10, "C X", 10, "A Y", 10, "A X", 10, "C X", 10, "B X", 10, "A Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "C Z", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "C X", 10, "B Z", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "C Y", 10, "B X", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "B X", 10, "A Z", 10, "C Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "C Z", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "C X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Y", 10, "A X", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A X", 10, "B X", 10, "A Z", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A Y", 10, "B Y", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "C Y", 10, "A X", 10, "A Z", 10, "C Y", 10, "A Y", 10, "C Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "C X", 10, "A Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C X", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "A Y", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "C Z", 10, "A Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Z", 10, "A X", 10, "B X", 10, "B X", 10, "A Z", 10, "A Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "A X", 10, "C Z", 10, "A X", 10, "B X", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B Z", 10, "C X", 10, "A Y", 10, "A X", 10, "A Z", 10, "C X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "B Z", 10, "B X", 10, "A Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A X", 10, "A X", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "C Y", 10, "B X", 10, "B X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "C X", 10, "B X", 10, "B X", 10, "B X", 10, "C X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A Z", 10, "C X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "C Z", 10, "C Y", 10, "C Y", 10, "C Z", 10, "A Y", 10, "A Z", 10, "C Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "C X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Z", 10, "B X", 10, "A X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "C Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "C X", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "A X", 10, "C X", 10, "B Z", 10, "C Y", 10, "C Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Z", 10, "C Y", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "B X", 10, "C Z", 10, "A Y", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Z", 10, "A Y", 10, "B Z", 10, "A Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "C X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A Z", 10, "C Y", 10, "B X", 10, "A X", 10, "B X", 10, "C X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Z", 10, "C Y", 10, "C Z", 10, "C Y", 10, "A Y", 10, "C X", 10, "C X", 10, "B X", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "C Z", 10, "C X", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "A Y", 10, "C Y", 10, "B Y", 10, "B X", 10, "A Y", 10, "C X", 10, "A Z", 10, "C Y", 10, "A X", 10, "B Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "C X", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "A Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "C Z", 10, "B Z", 10, "B X", 10, "C Y", 10, "C Y", 10, "A Z", 10, "C X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "B Z", 10, "B X", 10, "C X", 10, "A Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Z", 10, "B Z", 10, "C Y", 10, "C Y", 10, "A Z", 10, "B Z", 10, "B X", 10, "B X", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "C Y", 10, "C X", 10, "A Y", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C X", 10, "A Y", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "B Y", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A Z", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "C Y", 10, "B X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Z", 10, "C Y", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "C Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Z", 10, "A Y", 10, "B Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Z", 10, "B Z", 10, "A X", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Z", 10, "C Y", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "A Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B X", 10, "C Y", 10, "A X", 10, "B X", 10, "C Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "B X", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "C Z", 10, "C Z", 10, "C Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "A Y", 10, "B X", 10, "A Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "C Z", 10, "B X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Y", 10, "B Z", 10, "A Z", 10, "A X", 10, "B Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A X", 10, "B Z", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A Y", 10, "A Y", 10, "A X", 10, "C Z", 10, "C X", 10, "A Y", 10, "C X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "A Z", 10, "A Y", 10, "A Y", 10, "B Z", 10, "C Z", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C X", 10, "A Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "C Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "C Z", 10, "B Z", 10, "C Y", 10, "C Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Z", 10, "A Z", 10, "C Y", 10, "A Y", 10, "C X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "C Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "C Z", 10, "C X", 10, "A X", 10, "B X", 10, "A X", 10, "A Z", 10, "A X", 10, "C Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "C X", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "B X", 10, "C X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A Z", 10, "A Z", 10, "A Z", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "C Z", 10, "B Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "B X", 10, "A Y", 10, "C Y", 10, "B X", 10, "A X", 10, "B X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "C Y", 10, "C X", 10, "B X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "C Z", 10, "B X", 10
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


global _start

_start:
    push rbp
    mov rbp, rsp

    call part1

    mov rax, r8
    call debug_print

    call part2

    call exit

; ============================================================================
; Part 2
; ============================================================================
part2:
    xor r8, r8      ; total 
    xor r9, r9      ; pos in string
    xor r10, r10    ; enemy move
    xor r11, r11    ; my move

loop2:
    cmp r9, data_len
    jge return

    ; get the next char of data
    mov r10b, [data + r9]

    ; add 2 to get to the next char and skip the space
    add r9, 2

    ; move that char into r11
    mov r11b, byte [data + r9]

    add r9, 2 ; skip the \n

add_to_r8_2:
    cmp r11b, XVAL
    je need_loss

    ; add 3 for draw
    add r8, 3
    cmp r11b, YVAL
    je need_draw

    ; add 6 for win
    add r8, 3
    jmp need_win

need_loss:
    cmp r10b, ROCK
    je need_scissors
    cmp r10b, PAPER
    je need_rock
    cmp r10b, SCISSORS
    je need_paper

need_draw:
    cmp r10b, ROCK
    je need_rock
    cmp r10b, PAPER
    je need_paper
    cmp r10b, SCISSORS
    je need_scissors
need_win:
    cmp r10b, ROCK
    je need_paper
    cmp r10b, PAPER
    je need_scissors
    cmp r10b, SCISSORS
    je need_rock

need_rock:
    add r8, 1
    jmp loop2
need_paper:
    add r8, 2
    jmp loop2
need_scissors:
    add r8, 3
    jmp loop2
    
; ============================================================================
; Part 1
; ============================================================================

part1:
    xor r8, r8      ; total 
    xor r9, r9      ; pos in string
    xor r10, r10    ; enemy move
    xor r11, r11    ; my move

loop:
    cmp r9, data_len
    jge return

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

    cmp r11b, XVAL
    je rock

    ; add 1 for paper
    add r8, 1
    cmp r11b, YVAL
    je paper

    ; add 1 for scissors
    add r8, 1
    jmp scissors

rock:
    cmp r10b, PAPER
    je loss

    cmp r10b, ROCK
    je draw

    cmp r10b, SCISSORS
    je win

paper:
    cmp r10b, PAPER
    je draw

    cmp r10b, ROCK
    je win

    cmp r10b, SCISSORS
    je loss

scissors:
    cmp r10b, PAPER
    je win

    cmp r10b, ROCK
    je loss

    cmp r10b, SCISSORS
    je draw
win:
    add r8, 6
    jmp loop
draw:
    add r8, 3
    jmp loop
loss:
    jmp loop

return:
    ret

exit:
    mov rax, r8
    call debug_print
    mov rdi, 0
    mov rax, 60
    syscall
