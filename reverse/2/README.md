0x0 Intorduction
================

You get a shellcode.

first step need to pack it to hex.

And write a code to execute it.

When you execute shellcode will do some xor.

But it not really flag,look at some code.

	gdb-peda$ x/100i 0x400568

	=> 0x400568:	movabs rax,0x7d3f7e554f592045

	   0x400572:	push   rax

	   0x400573:	movabs rax,0x5241204552454857

	   0x40057d:	push   rax

	   0x40057e:	movabs rax,0x7b47414c46544f4e

	   0x400588:	push   rax

	   0x400589:	mov    rsi,rsp

	   0x40058c:	xor    rdx,rdx

	   0x40058f:	mov    al,0x8c

	   0x400591:	xor    al,cl

	   0x400593:	mov    BYTE PTR [rsi+rdx*1],al

	   0x400596:	inc    rdx

	   0x400599:	mov    al,0x84

	   0x40059b:	xor    al,cl

	   0x40059d:	mov    BYTE PTR [rsi+rdx*1],al

	   0x4005a0:	inc    rdx

	   0x4005a3:	mov    al,0x9e

	   0x4005a5:	xor    al,cl

	   0x4005a7:	mov    BYTE PTR [rsi+rdx*1],al

In this code,we can find xor loss cl,and set cl is 237 you will get current flag. 
