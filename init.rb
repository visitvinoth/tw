$:.unshift('app')

# require 'rubygems'
# require 'ruby-debug'
require './app/libraries.rb'
require './app/metal'
require './app/command'
require "./app/inter_galactic_notation"

def input_from_console
	while(true)
		Command.new(gets.chomp).process
	end
end

def input_from_file(file_name)
	File.open(file_name, "r").each_line do |str|
		Command.new(str).process
	end
end


puts "Welcome to Inter-Galactic Currency Calculator!!!"
puts "How would you like to enter your inputs?"
puts "  1. From file"
puts "  2. From console"
print "Please enter your option: "
option = gets.chomp.to_i
case option
when 1
	puts "Please enter the file_name(sample input is available at sample_input.txt . You check that.): "
	input_from_file(gets.chomp);
when 2
	puts "Please enter your commands. 'Exit' command will terminate the program."
	input_from_console
else
	puts "Wrong Option. Please try Again."
end
