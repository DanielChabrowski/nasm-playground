%include "sys.asm"

%macro cout 2
    sys.write FD_STDOUT, %1, %2
%endmacro

%macro cerr 2
    sys.write FD_STDERR, %1, %2
%endmacro

%macro cin 2
    sys.read FD_STDIN, %1, %2
%endmacro

section .bss
    bufferMaxSize equ 120
    buffer resb bufferMaxSize

section .text
    global _start

_start:
    cout greeting, greeting_len
    cout enter_num, enter_num_len

    cin buffer, bufferMaxSize

    cout print_num, print_num_len
    cout buffer, bufferMaxSize

    sys.exit 0

section .data
    greeting: db 'Hello world!', 0xA
    greeting_len: equ $-greeting

    enter_num: db 'Please enter your string (max 119 chars): '
    enter_num_len: equ $-enter_num

    print_num: db 'Your string: '
    print_num_len: equ $-print_num
