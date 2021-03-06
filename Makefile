
all:
	gcc -m64 bof.c -o bof -z execstack -fno-stack-protector
	nasm -f elf64 shellcode_etc_passwd.asm -o shellcode_etc_passwd.o
	nasm -f elf64 shellcode_sh.asm -o shellcode_sh.o

clean:
	rm -rf bof
	rm -rf *.o
