; nasm -felf64 -o day2.o day2.asm -D UNIX && gcc -no-pie -o day2 day2.o -m64 && ./day2
; nasm -felf64 day2.asm && ld day2.o -o day2 && ./day2

%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_WRITE 1
%define SYS_EXIT 60

AVAL equ 65
BVAL equ 66
CVAL equ 67
XVAL equ 88
YVAL equ 89
ZVAL equ 90

ROCK equ 65
PAPER equ 66
SCISSORS equ 67

section .rodata
  data: db "B Z", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "C Y", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A X", 10, "C Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "C Y", 10, "C Z", 10, "A X", 10, "C Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Z", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "C X", 10, "A X", 10, "B Z", 10, "B Y", 10, "B X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "C X", 10, "A X", 10, "B X", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Z", 10, "B X", 10, "A X", 10, "C X", 10, "B Y", 10, "A Z", 10, "C Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "B Z", 10, "C Y", 10, "B X", 10, "B X", 10, "C Z", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "B Y", 10, "B Z", 10, "B X", 10, "A X", 10, "C Y", 10, "B Z", 10, "B Y", 10, "B X", 10, "B X", 10, "A X", 10, "C Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Z", 10, "A Y", 10, "B X", 10, "A X", 10, "A Z", 10, "B X", 10, "B X", 10, "C Z", 10, "C Y", 10, "B X", 10, "B X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "A X", 10, "B Y", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Z", 10, "B X", 10, "A X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "B X", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "A Y", 10, "A X", 10, "A X", 10, "A Z", 10, "C Y", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "A X", 10, "A Y", 10, "A Y", 10, "C Z", 10, "C Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Z", 10, "C Y", 10, "C Y", 10, "C Y", 10, "C Y", 10, "C X", 10, "A X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "B Z", 10, "A Y", 10, "C X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A X", 10, "C Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "A Z", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "A X", 10, "C Y", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A Y", 10, "C X", 10, "B X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Y", 10, "C Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "A X", 10, "C Y", 10, "A X", 10, "C X", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "B X", 10, "A Y", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "C X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Z", 10, "A X", 10, "B X", 10, "B X", 10, "C X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Z", 10, "C Y", 10, "B Z", 10, "C Y", 10, "C X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B Z", 10, "B Z", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Z", 10, "C Y", 10, "C Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "C Z", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "A Z", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "C Z", 10, "A X", 10, "C X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "B X", 10, "C Z", 10, "C Y", 10, "A Z", 10, "B Z", 10, "C X", 10, "A Y", 10, "A Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "C Z", 10, "A Y", 10, "C Y", 10, "A X", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "C Z", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "A Y", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "C Z", 10, "A X", 10, "A Z", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "C Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "A X", 10, "A Z", 10, "B X", 10, "B X", 10, "C Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Z", 10, "A Y", 10, "C Z", 10, "B Z", 10, "A Y", 10, "C Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "B Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Z", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "C X", 10, "C Z", 10, "A X", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "C X", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "C X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "A Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "B Z", 10, "B X", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "C Y", 10, "C Z", 10, "A X", 10, "B X", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "C X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "B Y", 10, "A X", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "C X", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Z", 10, "A X", 10, "C X", 10, "B Z", 10, "B X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "A Y", 10, "A Y", 10, "B Y", 10, "B X", 10, "B Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "B Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "A Z", 10, "A X", 10, "A X", 10, "B X", 10, "B X", 10, "A Z", 10, "B X", 10, "A X", 10, "A Z", 10, "A X", 10, "A Z", 10, "A Y", 10, "A X", 10, "A Z", 10, "C X", 10, "A X", 10, "C Y", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "B X", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "B Z", 10, "C Y", 10, "B Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "C Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "C Z", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "C X", 10, "C Y", 10, "A Z", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "A Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "B Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Z", 10, "B Z", 10, "C Z", 10, "B Z", 10, "A Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Z", 10, "A Z", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "C Z", 10, "A Z", 10, "B X", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C X", 10, "A Y", 10, "A X", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Z", 10, "A Z", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A X", 10, "C Z", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C X", 10, "A Z", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B X", 10, "C Y", 10, "A X", 10, "A Z", 10, "B Z", 10, "C Y", 10, "A Z", 10, "A X", 10, "A Z", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "A Z", 10, "B Z", 10, "A X", 10, "A X", 10, "C Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B X", 10, "A X", 10, "C X", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C Y", 10, "C Y", 10, "B X", 10, "A Z", 10, "A Y", 10, "C Y", 10, "B X", 10, "B Z", 10, "B X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Z", 10, "B X", 10, "A X", 10, "C Z", 10, "B X", 10, "B X", 10, "B X", 10, "C X", 10, "C Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "C Y", 10, "C X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "C Z", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A Y", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "C Y", 10, "A X", 10, "A X", 10, "B Y", 10, "B X", 10, "A Y", 10, "C X", 10, "B Z", 10, "B Z", 10, "A Y", 10, "C Z", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "C Z", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Z", 10, "B X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "B Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "C Y", 10, "A Y", 10, "C X", 10, "B X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "B X", 10, "C Y", 10, "A Z", 10, "A X", 10, "B Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A Y", 10, "A Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "C X", 10, "A X", 10, "C Z", 10, "B X", 10, "C X", 10, "B Z", 10, "B Z", 10, "A Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "C Z", 10, "C Y", 10, "A Y", 10, "C Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "B X", 10, "C Z", 10, "B Z", 10, "C Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C X", 10, "A Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "B Z", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "C Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "B X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A X", 10, "C Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "B X", 10, "C Y", 10, "A Z", 10, "C X", 10, "A Y", 10, "A X", 10, "C X", 10, "B X", 10, "A Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "C Z", 10, "B X", 10, "C Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "C X", 10, "B Z", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "C Y", 10, "B X", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "B X", 10, "A Z", 10, "C Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "C Z", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "C X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Y", 10, "A X", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A X", 10, "B X", 10, "A Z", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "B X", 10, "C Y", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A Y", 10, "B Y", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "C Y", 10, "A X", 10, "A Z", 10, "C Y", 10, "A Y", 10, "C Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "C X", 10, "A Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C X", 10, "A Y", 10, "A X", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C X", 10, "B Z", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "A Y", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "C Z", 10, "A Y", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Z", 10, "A X", 10, "B X", 10, "B X", 10, "A Z", 10, "A Y", 10, "A X", 10, "C Y", 10, "A Y", 10, "A X", 10, "C Z", 10, "A X", 10, "B X", 10, "A Y", 10, "B X", 10, "A Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "C Z", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B Z", 10, "C X", 10, "A Y", 10, "A X", 10, "A Z", 10, "C X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "A X", 10, "B Z", 10, "B X", 10, "A Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A X", 10, "A X", 10, "B X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "C Y", 10, "B X", 10, "B X", 10, "A Y", 10, "B X", 10, "B Z", 10, "A X", 10, "C X", 10, "B X", 10, "B X", 10, "B X", 10, "C X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A Z", 10, "C X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "C Z", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "C Z", 10, "C Y", 10, "C Y", 10, "C Z", 10, "A Y", 10, "A Z", 10, "C Z", 10, "A Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "C X", 10, "A Y", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Z", 10, "B X", 10, "A X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "C Z", 10, "B X", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "C X", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "B X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "B Z", 10, "B X", 10, "B X", 10, "A X", 10, "C X", 10, "B Z", 10, "C Y", 10, "C Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A Y", 10, "C Z", 10, "C Y", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "B Z", 10, "B X", 10, "C Z", 10, "A Y", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Z", 10, "A Y", 10, "B Z", 10, "A Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "C X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A Z", 10, "C Y", 10, "B X", 10, "A X", 10, "B X", 10, "C X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A Z", 10, "C Y", 10, "C Z", 10, "C Y", 10, "A Y", 10, "C X", 10, "C X", 10, "B X", 10, "A Y", 10, "A X", 10, "B X", 10, "B X", 10, "C Z", 10, "C X", 10, "A X", 10, "A Y", 10, "B X", 10, "B X", 10, "C X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "A X", 10, "A Y", 10, "A Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "A Y", 10, "C Y", 10, "B Y", 10, "B X", 10, "A Y", 10, "C X", 10, "A Z", 10, "C Y", 10, "A X", 10, "B Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "C X", 10, "A Z", 10, "A X", 10, "B Z", 10, "B X", 10, "B X", 10, "A X", 10, "B X", 10, "A Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "C Z", 10, "B Z", 10, "B X", 10, "C Y", 10, "C Y", 10, "A Z", 10, "C X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A X", 10, "A Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "B Z", 10, "B X", 10, "C X", 10, "A Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Z", 10, "B Z", 10, "C Y", 10, "C Y", 10, "A Z", 10, "B Z", 10, "B X", 10, "B X", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "C Y", 10, "C X", 10, "A Y", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "B Z", 10, "C X", 10, "A Y", 10, "B X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "B X", 10, "B Y", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "A Z", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "B X", 10, "B X", 10, "B X", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B Z", 10, "B Z", 10, "C Y", 10, "B X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B X", 10, "A X", 10, "A X", 10, "A Z", 10, "C Y", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "A X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "C Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Z", 10, "A Y", 10, "B Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "C Y", 10, "A X", 10, "B Z", 10, "A X", 10, "A Z", 10, "B Z", 10, "A X", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Z", 10, "C Y", 10, "A Z", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "A Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "B X", 10, "C Y", 10, "A Y", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Y", 10, "B X", 10, "C Y", 10, "A X", 10, "B X", 10, "C Z", 10, "A Y", 10, "B X", 10, "A Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "B Z", 10, "A Y", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "B Z", 10, "A Y", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "B X", 10, "A Y", 10, "B X", 10, "B X", 10, "A X", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "A Y", 10, "C Z", 10, "C Z", 10, "C Y", 10, "A Y", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "A Y", 10, "A X", 10, "C Y", 10, "B X", 10, "A Y", 10, "B X", 10, "A Z", 10, "A X", 10, "A Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "C Y", 10, "C Z", 10, "B X", 10, "A Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B X", 10, "C Y", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "A Y", 10, "B Y", 10, "B Z", 10, "A Z", 10, "A X", 10, "B Y", 10, "A X", 10, "B Z", 10, "A Y", 10, "B X", 10, "A X", 10, "B Z", 10, "C Z", 10, "B Z", 10, "B Z", 10, "A Y", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "A Y", 10, "A Y", 10, "A X", 10, "C Z", 10, "C X", 10, "A Y", 10, "C X", 10, "A Y", 10, "A Z", 10, "C Y", 10, "A X", 10, "B X", 10, "A X", 10, "B Z", 10, "A X", 10, "C Y", 10, "A Y", 10, "B X", 10, "C Y", 10, "A Y", 10, "A Z", 10, "A Y", 10, "A Y", 10, "B Z", 10, "C Z", 10, "C Y", 10, "A Y", 10, "A Y", 10, "B X", 10, "C X", 10, "A Z", 10, "B Z", 10, "C Y", 10, "A X", 10, "A Y", 10, "B X", 10, "A Y", 10, "C Y", 10, "C Z", 10, "A Y", 10, "B Z", 10, "A X", 10, "C Y", 10, "B X", 10, "B Z", 10, "A X", 10, "C Z", 10, "B Z", 10, "C Y", 10, "C Z", 10, "B Z", 10, "A X", 10, "A Y", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "A X", 10, "B Z", 10, "C Y", 10, "A Z", 10, "A Z", 10, "C Y", 10, "A Y", 10, "C X", 10, "B X", 10, "A X", 10, "A X", 10, "B X", 10, "B Z", 10, "B X", 10, "B Z", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "A X", 10, "C Z", 10, "B Z", 10, "A X", 10, "C Z", 10, "C Z", 10, "C X", 10, "A X", 10, "B X", 10, "A X", 10, "A Z", 10, "A X", 10, "C Z", 10, "A X", 10, "A X", 10, "B Z", 10, "C Z", 10, "C Y", 10, "B Z", 10, "B X", 10, "A X", 10, "A X", 10, "A Y", 10, "B Z", 10, "A Y", 10, "B X", 10, "B Z", 10, "C X", 10, "B Z", 10, "B X", 10, "A Y", 10, "B Z", 10, "A Z", 10, "A Y", 10, "A Y", 10, "B X", 10, "C X", 10, "A Y", 10, "A Y", 10, "C Y", 10, "C Y", 10, "B Z", 10, "B X", 10, "C Y", 10, "C Y", 10, "A Y", 10, "A X", 10, "A Y", 10, "A Y", 10, "B Z", 10, "B X", 10, "A X", 10, "B X", 10, "B Z", 10, "B Z", 10, "A Z", 10, "A Z", 10, "A Z", 10, "A X", 10, "B X", 10, "B Z", 10, "A X", 10, "B Z", 10, "A X", 10, "B Z", 10, "B X", 10, "C Z", 10, "B Y", 10, "A Y", 10, "A Y", 10, "A X", 10, "A X", 10, "B Z", 10, "B Z", 10, "B X", 10, "A Y", 10, "C Y", 10, "B X", 10, "A X", 10, "B X", 10, "C Y", 10, "A X", 10, "A X", 10, "B X", 10, "C Y", 10, "C Y", 10, "C X", 10, "B X", 10, "C Y", 10, "A Z", 10, "B Z", 10, "B Z", 10, "B Z", 10, "B X", 10, "B Z", 10, "A X", 10, "B X", 10, "A X", 10, "A Y", 10, "C Z", 10, "B X", 10
  data_len: equ $ - data
  fmt1: db "Part1: %d", 10, 0
  fmt2: db "Part2: %d", 10, 0

section .text

global main
extern printf

main:
    push rbp
    mov rbp, rsp

    call part1

    mov rdi, fmt1
    mov rsi, r8
    call printf

    call part2

    mov rdi, fmt2
    mov rsi, r8
    call printf

    call exit

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
    add r8, 3 ; add only 3 for the fallthrough
draw:
    add r8, 3
loss:
    jmp loop

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
    
return: ret

exit:
    mov rdi, 0
    mov rax, 60
    syscall
