#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
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
	int fd = open("file", O_CREAT | O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
	printf("writing: %ld\n", ft_write(fd, "pouet\n", 6));
	printf("writing in erroneous fd: %ld\n", ft_write(-1, "pouet\n", 6));
	printf("errno: %d strerror: %s\n", errno, strerror(errno));
	close(fd);
	printf("%ld\n", sizeof(int));
	printf("%s\n", ft_strdup("allo"));
	return 0;
}
