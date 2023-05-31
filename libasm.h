#ifndef LIBASM_H
# define LIBASM_H
# include <errno.h>
# include <stdlib.h>

extern unsigned long ft_strlen(char* str);
extern char *ft_strcpy(char *dst, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, const void* buff, size_t count);
extern ssize_t ft_read(int fd, void* buf, size_t count);
extern char* ft_strdup(char* str);

#endif
