section .text
global ft_strlen
;rdi input null-terminated string pointer
;rax return value
ft_strlen:
	push rbp
	mov rbp, rsp;on crée une nouvelle stack frame
	mov rax, -1
_ft_strlen_loop:
	inc rax
	mov cl, [rdi + rax]
	cmp cl, 0
	jne _ft_strlen_loop
_ft_strlen_finish:
	pop rbp
	ret
