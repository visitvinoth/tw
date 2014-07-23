class Fixnum
	@@roman_literal_map = [["M",1000],["CM",900],["D",500],["CD",400],["C",100],["XC",90],["L",50],["XL",40],["X",10],["IX",9],["V",5],["IV",4],["I",1]]
	def self.from(roman_string)
		sum = 0
		for key, value in @@roman_literal_map
			while roman_string.index(key)==0
				sum += value
				roman_string.slice!(key)
			end
		end
		sum
	end
end

class String
	def is_a_valid_intergalactic_string?
		InterGalacticNotation.notation_strings.include? self
	end
end
