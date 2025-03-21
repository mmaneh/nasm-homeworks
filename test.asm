extern printf
extern scanf
;task 2 chi ashxatum
section .rodata
  print_fmt db "The result is: %d", 10, 0
  scan_fmt db "%d", 0
	error_fmt db "Division by 0 is not allowed.", 10, 0
section .bss
  num1 resd 1
  num2 resd 1
  op resd 1
section .text
global main
main:  
 push rbp
 mov rbp,rsp

;enter the operation
 mov rdi, scan_fmt
 mov rsi, op
 call scanf
 movsx r12, dword[op]

;enter num1
	xor rax, rax
 mov rdi,scan_fmt
 mov rsi, num1
 call scanf
	movsx rbx, dword[num1] 
;enter num2
	mov rax, rax
 mov rdi, scan_fmt
 mov rsi, num2
 call scanf
	movsx r15, dword[num2]
	
 cmp r12,1
 je add
 cmp r12,2
 je sub
 cmp r12,3
 je mul
 cmp r12,4
 je div
add:
 add rbx, r15
 jmp result
sub:   
 sub rbx, r15
 jmp result
mul:
	xor rax, rax
	xor rdx, rdx
	mov rax, rbx
 imul r15
	mov rbx, rax
 jmp result
div:
 cmp r15, 0
 je error
 xor rdx, rdx
	mov rax, rbx
 idiv r15
	mov rbx, rax
 jmp result
error:  
 xor  rax, rax
	mov rdi, error_fmt
	call printf
	jmp exit

result:
  mov rdi, print_fmt
 mov rsi, rbx
 call printf

exit:
 mov rsp, rbp
 pop rbp
 ret
