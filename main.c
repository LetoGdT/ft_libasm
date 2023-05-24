#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "libasm.h"

int main(int argc, char** argv) {
	printf("strlen: %lu\nft_strlen: %lu\n", strlen("pouet"), ft_strlen("pouet"));
	char *buff, *src = "pouet";
	buff = malloc(strlen(src) + 1);
	int i = 0;
	while (i < ft_strlen(src))
		buff[i++] = 'a';
	buff[i] = 0;
	printf("ft_strcpy\n");
	printf("avant copie: %p \"%s\"\n", buff, buff);
	printf("après copie: %p \"%s\"\n", ft_strcpy(buff, src), buff);
	i = 0;
	while (i < ft_strlen(src))
		buff[i++] = 'a';
	buff[i] = 0;
	printf("\"aaaaa\" == \"pouet\": %d\n", ft_strcmp(buff, src));
	printf("\"pouet\" == \"aaaaa\": %d\n", ft_strcmp(src, buff));
	printf("\"pouet\" == \"pouet\": %d\n", ft_strcmp(src, src));
	return 0;
}
