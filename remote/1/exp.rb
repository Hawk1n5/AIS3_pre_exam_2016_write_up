#!/usr/bin/env ruby
require '~/Tools/pwnlib'

host, port = 'quiz.ais3.org', 2154
#host, port = '127.0.0.1', 4444#'quiz.ais3.org', 53125

#1000.times do |i|
PwnTube.open(host, port) do |r|
	rand = `./a`	
	@r = r
	@r.recv()
	passcode = rand.to_i() ^ 0x2016a153
	@r.send("#{passcode}\n")
	puts @r.recv()
end
#sleep(1)
#end
