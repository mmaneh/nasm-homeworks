extern printf 
extern scanf
; task 1
section .bss
         N  resq 1 
	 
section .rodata
	 scan1 db "%d", 0
	 fmt db "Input N: %d ", 10, 0

section .text
global main:
main:
	 push rbp
	 mov rbp, rsp
 
	 mov rdi, scan1 
	 mov rsi, N
	 call scanf
	 
	 mov rcx, [N]
	 mov rax,0
	 mov rbx,0

loop:   
	inc rbx
        add  rax,rbx
	dec rcx
	
	cmp rcx,0
	jne loop
	
	mov rdi, fmt
	mov rsi, rax
	call printf

	xor rax, rax
	mov rsp, rbp
	pop rbp
	ret
