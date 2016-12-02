#Copyright Andres Gomez Vidal

CC= gcc $(CFLAGS) -Wall #-O0
LIBSINCLUDE= # -pthread # -lm
LIBS =
HEADER_FILES_DIR = ./
INCLUDES = -I $(HEADER_FILES_DIR)
MAIN= main
SRCS = $(wildcard *.c)
DEPS = $(wildcard *.h)
OBJS = $(SRCS:.c=.o)
clean=rm -f $(MAIN) *.o
$(MAIN): $(OBJS)
	$(CC) -o $(MAIN) $(OBJS) $(LIBS) $(LIBSINCLUDE)
*.o: *.c $(DEPS)
	$(CC) -c $< $(INCLUDES)
clean:
	$(clean)
all:
	$(clean) && make
