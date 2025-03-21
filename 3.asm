extern printf
extern scanf
section .data
section .bss
	a resq 1
	b resq 1
section .rodata
	print_fmt db "The result is: ", 10,0
	scan_fmt db "%d", 0
section .text
global start
start:
  	push rbp 
	mov rbp,rsp


	mov rdi, scan_fmt
	mov rsi, a
	call scanf


	mov rdi, scan_fmt
	mov rsi, b
	call scanf
	
	mov rcx, qword[b]
	mov rax, qword[a]
   loop:
	dec rcx
	cmp rcx, 0
	je loop_end
	
	mul  qword[a]
	
	jmp loop


loop_end:
	
	mov rdi, print_fmt
	mov rsi, rax
	xor rax,rax
	call printf


	mov rsp, rbp
	pop rbp
	ret
