hola: hola.o
	ld -m elf_i386 -o hola hola.o

hola.o: hola.asm
	nasm -f elf -g -F stabs hola.asm -l hola.lst
