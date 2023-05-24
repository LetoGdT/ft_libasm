section .text
global ft_strcpy
;rdi char* dest, pointer to a buffer
;rsi char* src, pointer to a null terminated string
;rax return value, char* dest
ft_strcpy:
	push rbp
	mov rbp, rsp;on crée une nouvelle stack frame
	mov rax, 0 ; int i = 0
_loop:
	mov dl, [rsi + rax];on prend la valeur dans src[i] on met dans dl
	mov [rdi + rax], dl;on met la valeur dans dest[i]
	inc rax
	cmp dl, 0; on vérifie si src[i] == 0
	jne _loop;while (str[i] != 0)
_finish:
	mov rax, rdi;on prépare la valeur de retour
	pop rbp;on sort de la stack frame
	ret
