0x0 Introduction
================

	root@CTF:~/CTF/ais3_2016/remote/3# file remote3 

	remote3: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=da51300f57416d92b1be06f8592334107c41b531, not stripped

It have some teatures

	root@CTF:~/CTF/ais3_2016/remote/3# ./remote3 

	Welcome, please leave some message for me:a

	-------------------------

	 1. Add student          

	 2. Show a student       

	 3. Add a note           
	
	 4. Show a note          

	 5. Delete a note        

	 6. exit                 
	
	-------------------------
	
	Your choice :

0x1 Vulnerbility
================

This challage is House of force of heap.

In "3. Add a note" you can overwrite top chunk size.

Then malloc in anywhere you controller.

First.you need to leak address which is in heap.

You can add three note.delete 1 and 0. like this:

	0x804b000:	0x00000000	0x00000029	0x0804b028	0x00000000

	0x804b010:	0x00000000	0x00000000	0x00000000	0x00000000

	0x804b020:	0x00000000	0x00000000	0x00000000	0x00000029

	0x804b030:	0x00000000	0x00000000	0x00000000	0x00000000

	0x804b040:	0x00000000	0x00000000	0x00000000	0x00000000

	0x804b050:	0x00000000	0x00000029	0x00000061	0x00000000

	0x804b060:	0x00000000	0x00000000	0x00000000	0x00000000

	0x804b070:	0x00000000	0x00000000	0x00000000	0x00020f89

You can get heap address in note 0 (0x804b000).

Then add a note size is 128 and overwrite top chunk size(0x804b07c) to 0xffffffff

Then add three notes, last note will malloc in got.plt.

And you can use input name to set shellcode in .bss.

When overwrite got.plt will get shell.
