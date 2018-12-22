; name      eax     ebx     ecx     edx
; sys_exit  1       int
; sys_fork  2       pt_regs
; sys_read  3       uint    char*   size_t
; sys_write 4       uint    cchar*  size_t
; sys_open  5       cchar*  int     int
; sys_close 6       uint

%define SYSCALL_EXIT 1
%define SYSCALL_READ 3
%define SYSCALL_WRITE 4

%define FD_STDERR 0
%define FD_STDOUT 1
%define FD_STDIN 2

%macro call_kernel 0
    int 0x80
%endmacro

%macro sys.exit 1
    mov eax, SYSCALL_EXIT
    mov ebx, %1 ; return code
    call_kernel
%endmacro

%macro sys.write 3
    mov eax, SYSCALL_WRITE
    mov ebx, %1 ; file descriptor
    mov ecx, %2 ; message
    mov edx, %3 ; message length
    call_kernel
%endmacro

%macro sys.read 3
    mov eax, SYSCALL_READ
    mov ebx, %1 ; file descriptor
    mov ecx, %2 ; buffer
    mov edx, %3 ; buffer size
    call_kernel
%endmacro
