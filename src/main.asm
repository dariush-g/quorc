; ----- Layout: LEXER -----
%define LEXER_size 16
%define LEXER.tokens 0
%define LEXER.position 8
%define LEXER.line 12

global LEXER.new
LEXER.new:
push rbp
mov rbp, rsp
sub rsp, 16
mov qword [rbp - 8], rdi
mov dword [rbp - 12], esi
mov dword [rbp - 16], edx
mov rdi, LEXER_size
call malloc
mov rcx, rax
mov rax, qword [rbp - 8]
mov qword [rcx + 0], rax
mov eax, dword [rbp - 12]
mov dword [rcx + 8], eax
mov eax, dword [rbp - 16]
mov dword [rcx + 12], eax
mov rax, rcx
add rsp, 16
mov rsp, rbp
pop rbp
ret

global main
main:
push rbp
mov rbp, rsp
sub rsp, 16
mov dword [rbp - 4], edi
mov qword [rbp - 12], rsi
xor rcx, rcx
mov ecx, dword [rbp - 4]
mov rdx, 2
cmp rcx, rdx
setne al
movzx rax, al
cmp rax, 0
je .else0
mov rax, 1
mov rdi, rax
call exit
.else0:
xor rbx, rbx
mov rbx, qword [rbp - 12]
mov r8d, 1
imul r8, 8
add rbx, r8
mov qword [rbp - 12], rbx
xor r9, r9
mov r9, qword [rbp - 12]
sub rsp, 8
mov r9, [r9]
mov qword [rbp - 24], r9
xor r10, r10
mov r10, qword [rbp - 24]
mov rdi, r10
call read_file
mov rdi, rax
call print_str
sub rsp, 8
xor r11, r11
mov r11, qword [rbp - 24]
mov rdi, r11
call strlen
mov qword [rbp - 32], rax
xor r12, r12
mov r12, qword [rbp - 24]
xor r13, r13
mov r13d, dword [rbp - 32]
mov r14, 1
sub r13, r14
mov rdi, r12
mov rsi, r13
call char_at
mov r15, 'u'
cmp rax, r15
setne al
movzx rax, al
xor rcx, rcx
mov rcx, qword [rbp - 24]
xor rdx, rdx
mov edx, dword [rbp - 32]
mov rbx, 2
sub rdx, rbx
mov rdi, rcx
mov rsi, rdx
call char_at
mov r9, 'q'
cmp rax, r9
setne al
movzx rax, al
cmp rax, 1
jne .and_end_1
cmp rax, 1
jne .and_end_1
mov rax, 1
jmp .and_done_2
.and_end_1:
mov rax, 0
.and_done_2:
xor r10, r10
mov r10, qword [rbp - 24]
xor r12, r12
mov r12d, dword [rbp - 32]
mov r13, 3
sub r12, r13
mov rdi, r10
mov rsi, r12
call char_at
mov rbx, '.'
cmp rax, rbx
setne al
movzx rax, al
cmp rax, 1
jne .and_end_2
cmp rax, 1
jne .and_end_2
mov rax, 1
jmp .and_done_3
.and_end_2:
mov rax, 0
.and_done_3:
cmp rax, 0
je .else3
mov rcx, 1
mov rdi, rcx
call exit
.else3:
mov rdx, 0
xor rax, rax
mov rax, rdx
mov rdi, 10
call print_char
mov rdi, rbx
jmp .Lret_main
.Lret_main:
mov rsp, rbp
pop rbp
ret
global char_at
char_at:
push rbp
mov rbp, rsp
sub rsp, 16
mov qword [rbp - 8], rdi
mov dword [rbp - 12], esi
sub rsp, 8
xor rax, rax
mov rax, qword [rbp - 8]
xor r10, r10
mov r10, qword [rbp - 8]
xor rbx, rbx
mov ebx, dword [rbp - 12]
add r10, rbx
mov qword [rbp - 24], r10
xor rax, rax
mov rax, qword [rbp - 24]
mov al, byte [rax]
jmp .Lret_char_at
.Lret_char_at:
mov rsp, rbp
pop rbp
ret
global concat
concat:
push rbp
mov rbp, rsp
sub rsp, 16
mov qword [rbp - 8], rdi
mov qword [rbp - 16], rsi
sub rsp, 8
xor rcx, rcx
mov rcx, qword [rbp - 8]
mov rdi, rcx
call strlen
mov qword [rbp - 24], rax
sub rsp, 8
xor rdx, rdx
mov rdx, qword [rbp - 16]
mov rdi, rdx
call strlen
mov qword [rbp - 32], rax
xor rbx, rbx
mov ebx, dword [rbp - 24]
xor r10, r10
mov r10d, dword [rbp - 32]
add rbx, r10
mov rax, 1
add rbx, rax
mov rdi, rbx
call malloc
sub rsp, 8
mov qword [rbp - 40], rax
sub rsp, 8
xor r10, r10
mov r10, qword [rbp - 40]
mov qword [rbp - 48], r10
sub rsp, 8
mov rax, 0
mov dword [rbp - 56], eax
.while_start_4:
xor rax, rax
mov eax, dword [rbp - 56]
xor r10, r10
mov r10d, dword [rbp - 24]
cmp rax, r10
setl al
movzx rax, al
cmp rax, 1
jne .while_end_4
xor rax, rax
mov rax, qword [rbp - 40]
xor rax, rax
mov rax, qword [rbp - 8]
mov r10b, byte [rax]
mov byte [rax], r10b
xor rax, rax
mov rax, qword [rbp - 40]
mov eax, 1
add rax, rax
mov qword [rbp - 40], rax
xor rax, rax
mov rax, qword [rbp - 8]
mov r10d, 1
add rax, r10
mov qword [rbp - 8], rax
xor rax, rax
mov eax, dword [rbp - 56]
mov rax, 1
add rax, rax
mov qword [rbp - 56], rax
add rsp, 56
jmp .while_start_4
.while_end_4:
mov dword [rbp - 56], 0
.while_start_5:
xor r10, r10
mov r10d, dword [rbp - 56]
xor rax, rax
mov eax, dword [rbp - 32]
cmp r10, rax
setl al
movzx rax, al
cmp rax, 1
jne .while_end_5
xor rax, rax
mov rax, qword [rbp - 40]
xor rax, rax
mov rax, qword [rbp - 16]
mov r10b, byte [rax]
mov byte [rax], r10b
xor rax, rax
mov rax, qword [rbp - 40]
mov eax, 1
add rax, rax
mov qword [rbp - 40], rax
xor rax, rax
mov rax, qword [rbp - 16]
mov eax, 1
add rax, rax
mov qword [rbp - 16], rax
xor r10, r10
mov r10d, dword [rbp - 56]
mov rax, 1
add r10, rax
mov qword [rbp - 56], r10
add rsp, 56
jmp .while_start_5
.while_end_5:
xor rax, rax
mov rax, qword [rbp - 40]
mov rax, 0
mov byte [rax], al
xor rax, rax
mov rax, qword [rbp - 48]
jmp .Lret_concat
.Lret_concat:
mov rsp, rbp
pop rbp
ret
global contains_char
contains_char:
push rbp
mov rbp, rsp
sub rsp, 16
mov qword [rbp - 8], rdi
mov byte [rbp - 9], sil
sub rsp, 8
xor rax, rax
mov rax, qword [rbp - 8]
mov rdi, rax
call strlen
mov qword [rbp - 24], rax
sub rsp, 8
mov r10, 0
mov dword [rbp - 32], r10d
.while_start_6:
xor rax, rax
mov eax, dword [rbp - 32]
xor rax, rax
mov eax, dword [rbp - 24]
cmp rax, rax
setl al
movzx rax, al
cmp rax, 1
jne .while_end_6
xor r10, r10
mov r10, qword [rbp - 8]
xor rax, rax
mov eax, dword [rbp - 32]
mov rdi, r10
mov rsi, rax
call char_at
xor rax, rax
mov al, byte [rbp - 9]
cmp rax, rax
sete al
movzx rax, al
cmp rax, 0
je .else7
mov rax, 1
.else7:
xor rax, rax
mov eax, dword [rbp - 32]
mov rax, 1
add rax, rax
mov qword [rbp - 32], rax
add rsp, 32
jmp .while_start_6
.while_end_6:
mov rax, 0
jmp .Lret_contains_char
.Lret_contains_char:
mov rsp, rbp
pop rbp
ret
extern printf, strlen, fopen, fclose, fwrite, stat, rewind, fread, fseek, ftell, fflush
section .data
fmt_int: db "%d",0
fmt_char: db "%c",0
fmt_str: db "%s",0
fmt_float: db "%f",0
fmt_long: db "%ld",0
str_true: db "true",0
str_false: db "false",0
mode_write: db "w",0
section .text
global print_long
print_long:
    push rbp
    mov rbp, rsp
    sub rsp, 16         ;
    mov rsi, rdi
    mov rdi, fmt_long
    xor rax, rax
    call printf
    add rsp, 16
    pop rbp
    ret
global print_int
print_int:
    push rbp
    mov rbp, rsp
    sub rsp, 16         ;
    mov rsi, rdi
    mov rdi, fmt_int
    xor rax, rax
    call printf
    add rsp, 16
    pop rbp
    ret
; print_bool: rdi = 0 or 1
global print_bool
print_bool:
    push rbp
    mov rbp, rsp
    sub rsp, 16         
    cmp rdi, 0
    mov rdi, str_false
    mov rsi, str_true
    cmovne rdi, rsi
    xor rax, rax
    call printf
    add rsp, 16
    pop rbp
    ret

; print_char: rdi = char
global print_char
print_char:
    push rbp
    mov rbp, rsp
    sub rsp, 16        
    mov rsi, rdi
    mov rdi, fmt_char
    xor rax, rax
    call printf
    add rsp, 16
    pop rbp
    ret
global print_str
print_str:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rsi, rdi
    mov rdi, fmt_str            
    xor rax, rax
    call printf
    add rsp, 16
    pop rbp
    ret
global print_fp
print_fp:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rsi, rdi
    mov rdi, fmt_float
    xor rax, rax
    call printf
    add rsp, 16
    pop rbp
    ret
global write_file
write_file:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    push rbx
    push r12
    mov rbx, rdi
    mov r12, rsi
    mov rdi, rbx
    lea rsi, [rel mode_write]
    call fopen
    test rax, rax
    jz .error
    mov rbx, rax    
    mov rdi, r12
    call strlen
    mov rdi, r12    
    mov rsi, 1      
    mov rdx, rax   
    mov rcx, rbx    
    call fwrite
    mov rdi, rbx
    call fclose
    mov rax, 0
    jmp .cleanup
    .error:
    mov rax, -1
    .cleanup:
    pop r12
    pop rbx
    add rsp, 32
    pop rbp
    ret
global file_size
file_size:
    push rbp
    mov rbp, rsp
    sub rsp, 144             
    mov rsi, rsp             
    mov rdi, rdi             
    call stat               
    cmp eax, 0              
    jne .error
    mov rax, [rsp + 48]
    jmp .done
.error:
    mov rax, -1
.done:
    add rsp, 144
    pop rbp
    ret
global read_file
section .rodata
mode_rb: db "rb",0
section .text
read_file:
    push    r12
    push    rbp
    push    rbx
    lea     rsi, [rel mode_rb]
    call    fopen
    test    rax, rax
    je      .error
    mov     rbx, rax           
    mov     rdi, rbx
    mov     edx, 2           
    xor     esi, esi          
    call    fseek

    mov     rdi, rbx
    call    ftell
    mov     r12, rax           
    mov     rdi, rbx
    call    rewind

    lea     rdi, [r12+1]      
    call    malloc
    mov     rbp, rax         
    test    rax, rax
    je      .malloc_error

    mov     rdi, rbp          
    mov     rsi, 1            
    mov     rdx, r12          
    mov     rcx, rbx          
    call    fread

    mov     byte [rbp+r12], 0

    mov     rdi, rbx
    call    fclose

    mov     rax, rbp
    pop     rbx
    pop     rbp
    pop     r12
    ret

.malloc_error:
    mov     rdi, rbx
    call    fclose

.error:
    xor     eax, eax           
    pop     rbx
    pop     rbp
    pop     r12
    ret

extern malloc
extern free
extern exit
