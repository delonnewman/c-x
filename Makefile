CC = cc -std=c99

reverse$(EXE):
	$(CC) -o $@ c-x.c reverse.c

clean:
	rm reverse$(EXE)

.PHONY: clean
