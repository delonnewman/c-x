CC = cc99 -Wall -lm

reverse$(EXE):
	$(CC) -o $@ c-x.c reverse.c

clean:
	rm -vf reverse$(EXE)

.PHONY: clean
