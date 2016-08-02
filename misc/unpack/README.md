#unpack

In this challenge
`
root@CTF:~/CTF/ais3_2016/misc/unpack# file unpack_me.7z 
unpack_me.7z: ASCII text
`
This file header like:
`
0000000: 375a c2bc c2af 271c 0003 c297 c3ba 34c3  7Z....'.......4.
0000010: 8dc2 bf75 0400 0000 0000 2400 0000 0000  ...u......$.....
0000020: 0000 0f6d c293 207f c387 1bc3 9632 32c2  ...m.. ......22.
0000030: 8b34 c384 c2a3 c2bd c2a1 35c3 bf1b c3be  .4........5.....
`
I think is a 7z format,but it broken!!!!

The current 7z format header in second byte is 'z'.

so that fix this file and file will like.
`
root@CTF:~/CTF/ais3_2016/misc/unpack# file unpack_me.7z 
unpack_me.7z: 7-zip archive data, version 0.3
`

