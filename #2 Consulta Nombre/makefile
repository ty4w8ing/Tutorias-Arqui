consulta: consulta.o
	ld -m elf_i386 -o consulta consulta.o

consulta.o: consulta.asm
	nasm -f elf -g -F stabs consulta.asm -l consulta.lst
