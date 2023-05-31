extern ft_strlen
extern malloc
section .text
;rdi char* str
;rax return char*, NULL if failure with errno set
global ft_strdup
%define res [rbp - 8]
%define str [rbp - 24]
stack_size equ 24
ft_strdup:
	push rbp
	mov rbp, rsp; on crée une nouvelle stack frame
	sub rsp, stack_size;on fait de la place sur la stack pour des vars locales
	;mov res, 0;char* res = null
	mov str, rdi;on stock le paramètre, de -24 à -16, aligné sur une limite de 16

	call ft_strlen;rax = ft_strlen(rdi)
	mov rdi, rax
	inc rdi
	call [rel malloc wrt ..got];rax = malloc(ft_strlen(str) + 1)
	;équivalent à call malloc, mais avec des choses pour que le linkage se passe bien
	cmp rax, 0
	jl _finish;if (malloc(..) == NULL) goto _finish
	mov res, rax;on stock le pointeur sur la stack
	mov rdx, str
_loop:
	mov cl, [rdx];cl = octet de poids faible de rcx
	mov [rax], cl
	inc rax
	inc rdx
	cmp cl, 0
	jne _loop
	mov rax, res;on récup le pointeur de résultat
_finish:
	add rsp, stack_size
	pop rbp
	ret
