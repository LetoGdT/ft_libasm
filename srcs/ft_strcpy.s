section .text
global ft_strcpy
;rdi char* dest, pointer to a buffer
;rsi char* src, pointer to a null terminated string
;rax return value, char* dest
ft_strcpy:
	push rbp
	mov rbp, rsp;on crée une nouvelle stack frame
	mov rax, 0 ; int i = 0
_ft_strcpy_loop:
	mov dl, [rdi + rax];on prend la valeur dans dest[i] on met dans dl
	mov [rsi + rax], dl;on met la valeur dans src[i]
	inc rax
	cmp dl, 0; on vérifie si src[i] == 0
	jne _ft_strcpy_loop;while (str[i] != 0)
_ft_strcpy_finish:
	mov rax, rdi;on prépare la valeur de retour
	pop rbp;on sort de la stack frame
	ret
