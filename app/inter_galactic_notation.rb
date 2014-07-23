require 'libraries.rb'
class InterGalacticNotation
	attr_accessor :string
	@@value_map = {} # To store all the roman to inter-galactic mappings
	def initialize(string)
		@string = string
	end
	def self.feed_value_map(name, val) # Whenever command for roman to inter-galactic mapping is found, the @@value_map is fed with the mapping
		@@value_map[name] = val
	end
	def self.notation_strings
		@@value_map.keys
	end
	def self.value_map
		@@value_map
	end
	def self.parse_and_get_inter_galactic_sub_string(command) # from the command it parses and finds if any inter_galactic_string is available
		command_words = command.split
		inter_galactic_string = []
		command_words.each do |command_word|
			if command_word.is_a_valid_intergalactic_string?
				inter_galactic_string << command_word 
			else
				break if inter_galactic_string.size > 0
			end
		end
		if inter_galactic_string.length > 0
			ign = InterGalacticNotation.new(inter_galactic_string.join(' '))
			return ign if ign.valid?
		end
		return nil
	end

	def to_roman # returns roman representaion 
		@string.split.map{ |e|  @@value_map[e] }.join
	end
	def to_i # calculates numeric value of it
		Fixnum.from(self.to_roman)
	end
	def to_s
		@string
	end
	def valid?
		invalid_stringlets = @string.split.detect { |e|  !@@value_map.keys.include? e } # non inter-galactic strings should jot be there
		!invalid_stringlets && validate_roman
	end
	def validate_roman
		!(to_roman.match(/^M*(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/).nil?) #validating roman string
	end

end
