extern __errno_location
section .text
global ft_write
;rdi int fd
;rsi const void * buff
;rdx size_t count size_t
;return on rax: size_t number of bytes written or -1 in case of error
;sets errno if an error is detected
ft_write:
	push rbx;on sauvegarde le registre
	push rbp
	mov rbp, rsp;on setup la stack

	;syscall setup
	;rax: syscall number
	;rbx: first param
	;rcx: second param
	;rdx: third param
	;r8: fourth param
	;r9: fifth param
	mov rax, 1
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
