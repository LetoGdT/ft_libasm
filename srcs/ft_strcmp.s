
section .text
global ft_strcmp
;rdi char* s1, pointer to a null terminated string
;rsi char* s2, pointer to a null terminated string
;rax return value, see man 3 strcmp
ft_strcmp:
	push rbp
	mov rbp, rsp;on setup la stack frame
	mov rax, 0
	mov rdx, 0
	mov rcx, 0
_loop:
	mov dl, [rdi]
	mov cl, [rsi]
	cmp dl, 0
	je _finish;if (*s1 == 0) goto _finish;
	cmp cl, 0
	je _finish;if (*s2 == 0) goto _finish;
	inc rdi;s1++
	inc rsi;s2++
	cmp cl, dl;if (*s1 == *s2) goto _loop;else goto _finish
	je _loop
_finish:
	mov rax, rdx
	sub rax, rcx;return *s1 - *s2
	pop rbp;on sort de la stack frame
	ret
