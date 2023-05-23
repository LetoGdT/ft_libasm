#include <stdio.h>
#include <string.h>
#include "libasm.h"


int main(int argc, char** argv) {
	printf("strlen: %lu\nft_strlen: %lu\n", strlen("pouet"), ft_strlen("pouet"));
	return 0;
}
