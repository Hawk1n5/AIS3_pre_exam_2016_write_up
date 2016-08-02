#!/usr/bin/env ruby
require 'seven_zip_ruby'

def extr(file, pass)
	File.open(file, "rb") do |file|
  		SevenZipRuby::Reader.open(file, { password: pass }) do |szr|
			szr.extract_all "1"
  		end
	end
end

def getpass()
	`mv 1/secret.txt ./`
	pass = `cat secret.txt`
	`rm secret.txt`
	return pass.chomp
end

def getfile()
	file = `ls 1/`
	return file.chomp
end

def refile(file)
	f = File.open("1/#{file}", "rb")
	nf = File.open(file,"wb")
	re = false
	until f.eof?
		l = f.read()
		l[1]='z' unless re
		nf.write(l)
	end
	`rm 1/#{file}`
end

extr("MRMZqyqgskMkDiTfwzLz","5gMCmMkN58wfFBYtrzG6")
exit(0)
#while true
pass = getpass()
file =  getfile()

puts "[!] file : #{file}\n[!] pass : #{pass}"
refile(file)
extr(file, pass)
#end
#extr("3U6fkBUoiW4Hs3ZrhWd9","bziSMhYHEfZueDgKRoBz")
