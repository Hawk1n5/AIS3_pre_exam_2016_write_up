0x0 Intorduction
================

`root@CTF:~/CTF/ais3_2016/remote/2# file remote2 
remote2: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=24b23ffde625a8d09b757ff17387c318d3934bb7, stripped`

This is a 32 bit executable.


	Welcome to AIS3 online registration system!


	Show me your name: a

	Welcome a!


	Enter secret #1: a

	Enter secret #2: Checking ...

	Registration failed!

0x1 Vulnerability
=================
	
	gdb-peda$ r

	Starting program: /root/CTF/ais3_2016/remote/2/remote2 

	Welcome to AIS3 online registration system!


	Show me your name: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzz

	Welcome aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzz!


	Enter secret #1: [----------------------------------registers-----------------------------------]

	EAX: 0x7a7a7a7a ('zzzz')

	EBX: 0xf7fb0000 --> 0x1a8da8 

	ECX: 0xf7fb1878 --> 0x0 

	EDX: 0x0 

	ESI: 0x0 
	
	EDI: 0x0 

	EBP: 0xffffd498 --> 0xffffd4c8 --> 0x0 

	ESP: 0xffffd470 --> 0x80488c2 --> 0x45006425 ('%d')

	EIP: 0x804868a (call   0x8048550 <__isoc99_scanf@plt>)

	EFLAGS: 0x286 (carry PARITY adjust zero SIGN trap INTERRUPT direction overflow)

	[-------------------------------------code-------------------------------------]

	   0x804867c:	mov    eax,DWORD PTR [ebp-0x10]

	   0x804867f:	mov    DWORD PTR [esp+0x4],eax

	   0x8048683:	mov    DWORD PTR [esp],0x80488c2

	=> 0x804868a:	call   0x8048550 <__isoc99_scanf@plt>

	   0x804868f:	mov    DWORD PTR [esp],0x80488c5

	   0x8048696:	call   0x80484a0 <printf@plt>

	   0x804869b:	mov    eax,ds:0x804a080

	   0x80486a0:	mov    DWORD PTR [esp],eax

	Guessed arguments:
	
	arg[0]: 0x80488c2 --> 0x45006425 ('%d')

	arg[1]: 0x7a7a7a7a ('zzzz')

[------------------------------------stack-------------------------------------]

If you input name bigger then 96 bytes,next input will be controller to write anywhere.

So we overwrite got.plt and jump to 0x80486e5 to get the flag. 
