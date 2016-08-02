0x0 Intorduction
================

In this challenge

	root@CTF:~/CTF/ais3_2016/misc/unpack# file unpack_me.7z 

	unpack_me.7z: ASCII text

This file header like:

	0000000: 375a c2bc c2af 271c 0003 c297 c3ba 34c3  7Z....'.......4.

	0000010: 8dc2 bf75 0400 0000 0000 2400 0000 0000  ...u......$.....

	0000020: 0000 0f6d c293 207f c387 1bc3 9632 32c2  ...m.. ......22.

	0000030: 8b34 c384 c2a3 c2bd c2a1 35c3 bf1b c3be  .4........5.....

I think is a 7z format,but it broken!!!!

The current 7z format header in second byte is 'z'.

so that fix this file and file will like.

	root@CTF:~/CTF/ais3_2016/misc/unpack# file unpack_me.7z 

	unpack_me.7z: 7-zip archive data, version 0.3

0x1 eXtract files
=================

Now we need extract this zip file.

	root@CTF:~/CTF/ais3_2016# 7z x misc/unpack/unpack_me.7z 

	7-Zip [64] 9.20  Copyright (c) 1999-2010 Igor Pavlov  2010-11-18
	
	p7zip Version 9.20 (locale=zh_TW.UTF-8,Utf16=on,HugeFiles=on,1 CPU)

	Processing archive: misc/unpack/unpack_me.7z


	Enter password (will not be echoed) :

but it need password!!

And we check this zip file,can find another file, i think it password.

	root@CTF:~/CTF/ais3_2016# 7z l misc/unpack/unpack_me.7z 

	7-Zip [64] 9.20  Copyright (c) 1999-2010 Igor Pavlov  2010-11-18
	
	p7zip Version 9.20 (locale=zh_TW.UTF-8,Utf16=on,HugeFiles=on,1 CPU)

	Listing archive: misc/unpack/unpack_me.7z

	--
	
	Path = misc/unpack/unpack_me.7z
	
	Type = 7z

	Method = LZMA 7zAES

	Solid = -
	
	Blocks = 1

	Physical Size = 292355

	Headers Size = 227

	   Date      Time    Attr         Size   Compressed  Name
	
	------------------- ----- ------------ ------------  ------------------------
	
	2016-05-27 00:29:08 ....A       288200       292128  tArdCNLMPjLxqs5USx3T

	2016-05-27 00:29:08 ....A            0            0  UDJRRDVRJyfbWBxEMLEX

	------------------- ----- ------------ ------------  ------------------------
                                288200       292128  2 files, 0 folders

And you will get other 7z file,and secret.txt

7z file header is broken to!!

0x2 That coding
===============

First need to get password from secret.txt,and fix 7z file header.

Then eXtract until get the flag.
