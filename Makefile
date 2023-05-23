NAME		:=	libasm.a
TEST 		:=  test
SRCS		:=	srcs/ft_strlen.s
HEADERS 	:= 	libasm.h
TEST_SRCS 	:=  main.c
OBJS		:=	$(addprefix objs/,$(notdir $(patsubst %.s,%.o,$(SRCS))))
TEST_OBJS	:=	$(addprefix objs/,$(notdir $(patsubst %.c,%.o,$(TEST_SRCS))))

ASM			:=	nasm
CC 			:= 	gcc
AFLAGS		:=  -f elf64 
CFLAGS 		:=
LDFLAGS		:=
RM			:=	rm -f

all:			$(NAME)

test: 			all $(TEST_OBJS)
				$(CC) $(TEST_OBJS) $(NAME) -o $(TEST)

$(NAME):		$(OBJS)
				ar rc $(NAME) $(OBJS)
				ranlib $(NAME)

objs/%.o:		srcs/%.s
				@mkdir -p objs
				@echo "Compiling $<"
				@$(ASM) $(AFLAGS) $< -o $@

objs/%.o:		%.c $(HEADERS)
				@mkdir -p objs
				@echo "Compiling $<"
				@$(CC) $(CFLAGS) -c $< -o $@

clean:
				@echo "Deleting object files"
				@$(RM) $(OBJS)

fclean:			clean
				@$(RM) $(NAME)
				@$(RM) $(TEST)

re: 			fclean all

.PHONY:			all clean fclean re libs bonus
