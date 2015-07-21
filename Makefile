OBJ=disk

all: $(OBJ)

disk: boot noyau
	cat boot noyau | dd of=disk bs=512

noyau: noyau.asm
	nasm -f bin -o $@ $^

boot: boot.asm
	nasm -f bin -o $@ $^

clean:
	rm -f disk boot noyau
