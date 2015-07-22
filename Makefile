OBJ=disk
DIR=./Prog/

all: $(OBJ)

disk: dossier boot noyau
	cat $(DIR)/{boot,noyau} | dd of=$(DIR)disk bs=512

%: %.asm
	nasm -f bin -o $(DIR)$@ $^

kernel: *.o
	ld  -melf_i386 --oformat binary -Ttext 1000 -o $@ $^

%.o: %.c
	gcc -m32 -c $^

dossier:
	mkdir -v ./Prog

clean:
	rm -v $(DIR)/*
