extern __errno_location
section .text
;rdi int fd
;rsi void* buff
;rdx size_t count
global ft_read:
	push rbx;on sauvegarde le registre
	push rbp;on setup la stack
	mov rbp, rsp

	;syscall setup
	;rax: syscall number
	;rbx: first param
	;rcx: second param
	;rdx: third param
	;r8: fourth param
	;r9: fifth param
	mov rax, 0
	mov rbx, rdi
	mov rcx, rsi
	;mov rdx, rdx
	syscall

	cmp rax, 0
	jl _error;if (rax < 0) goto _error;
	pop rbp;on sort de la stack frame
	pop rbx
	ret
_error:
	neg rax
	mov rbx, rax
	call [rel __errno_location wrt ..got];équivalent à call __errno_location, mais avec des choses pour que le linkage se passe bien
	mov [rax], rbx;set errno
	mov rax, -1
	pop rbp;on sort de la stack frame
	pop rbx
	ret
