#ifndef LIBASM_H
# define LIBASM_H
# include <unistd.h>

extern unsigned long ft_strlen(char* str);
extern char *ft_strcpy(char *dst, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, const void *buff, size_t count);

#endif
