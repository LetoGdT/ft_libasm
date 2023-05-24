#include <stdio.h>
#include <string.h>
#include "libasm.h"


int main(int argc, char** argv) {
	printf("strlen: %lu\nft_strlen: %lu\n", strlen("pouet"), ft_strlen("pouet"));
	char buff[6] = "aaaaa", *src = "pouet";
	printf("avant copie: %s %p\n", buff, buff);
	printf("après copie: %s %p\n", strcpy(buff, src), buff);
	return 0;
}
