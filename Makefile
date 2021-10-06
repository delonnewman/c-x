CC = cc99 -Wall -lm

reverse$(EXE):
	$(CC) -o $@ c-x.c reverse.c

vector$(EXE):
	$(CC) -o $@ c-x.c vector.c

clean:
	rm -vf reverse$(EXE) vector$(EXE)

.PHONY: clean
