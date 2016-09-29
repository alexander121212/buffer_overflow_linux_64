# Stack based buffer overflow

## contents
- 0x00 Who is it?
- 0x01 Difference between x86 & x86_64
- 0x02 Vulnerable code snippet
- 0x03 Trigger the overflow
- 0x04 Control RIP
- 0x05 Jump into the user controlled buffer
- 0x06 Executing shellcode
- 0x07 GDB vs Real
- 0x08 EOF

### - 0x00 Who is it?
 - bof.c - is vulnarable code for exploitation.
- Makefile - file for buildinf
- see_shellcode.sh - Auxiliary script to visualize the shellcode
- shellcode_etc_passwd.asm - this file will do the shellcode for getting /etc/passwd
- shellcode_sh.asm - this file will do the shellcode for getting /bin/sh


### 0x01 Difference between x86 & x86_64
The first difference is the size of memory address. So memory addresses are 64 bits longer, but in usermod you only can use
the first 47 bits; keep this in mind, it is very important, because if you specified an
address greater than 0x00007fffffffffff, you'll get an exception. So
that means that address 0x0000414141414141 is safe but 0x4141414141414141 will raise exception.
In fact there are very many of others differences, but in our case, it’s not important to know all of them.
### 0x02 Vulnerable code
```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main(int argc, char **argv)
{
    char buffer[256];
    if(argc != 2) {
        exit(0);
    }

    printf("%p\n", buffer);
    strcpy(buffer, argv[1]);
    printf("%s\n", buffer);
    return 0;
}
```

We print the buffer pointer address to save time through the
exploit development.

### 0x03 Trigger the overflow
First we’re going to confirm that we're able to crash this process.
```sh
┌─[±][master U:2 ?:4 ✗][buffer_overflow_linux_64][]
└─▪ ./bof $(python -c 'print("A" * 300)')
0x7ffeded18530
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
Segmentation fault (core dumped)
```
### 0x04 Control RIP
### 0x05 Jump into the user controlled buffer
### 0x06 Executing shellcode
### 0x07 GDB vs Real
### 0x08 EOF

