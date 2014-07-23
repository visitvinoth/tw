class Command
	attr_accessor :string

	def initialize(string)
		@string = string
	end

	def process
		return if @string.chomp == ""
		command_words = string.split
		if @string == "Exit"
			abort('Thanks for using Inter-Galactic Currentcy Calculator.')
		elsif command_words.size == 3 && command_words[1] == "is" # This should be a command about inter-galactic roman mapping
			InterGalacticNotation.feed_value_map(command_words[0], command_words[2])
		elsif command_words.include?("how") # This must be a question
			process_question
		else # remaining can be the command about metal price
			load_metal
		end
	end

	def process_question
		if @string.start_with? "how much is "
			command = @string.split("how much is ")[1]
			inter_galactic_sub_string = InterGalacticNotation.parse_and_get_inter_galactic_sub_string(command)
			if inter_galactic_sub_string
				puts "#{inter_galactic_sub_string} is #{inter_galactic_sub_string.to_i}"
				return
			end
		elsif @string.start_with? "how many Credits is "
			command = @string.split("how many Credits is ")[1]
			inter_galactic_sub_string = InterGalacticNotation.parse_and_get_inter_galactic_sub_string(command)
			metal = Metal.parse_and_get_metal_object(command)
			if metal && inter_galactic_sub_string
				puts "#{inter_galactic_sub_string} #{metal.name} is #{(inter_galactic_sub_string.to_i * metal.price).to_i} Credits"
				return
			end
		end
		pardon
	end

	def load_metal
		command_words = @string.split
		inter_galactic_string = []
		bulk_metal_price = 0
		metal_name = ""
		command_words.each do |command_word|
			if command_word.is_a_valid_intergalactic_string?
				inter_galactic_string << command_word 
			elsif ["is", "Credits"].include? command_word
				next
			elsif command_word.to_i > 0
				bulk_metal_price = command_word.to_i
			else
				metal_name = command_word
			end
		end
		inter_galactic_value = InterGalacticNotation.new(inter_galactic_string.join(' ')) unless inter_galactic_string.size == 0
		if metal_name != "" && bulk_metal_price > 0 && inter_galactic_value.to_i > 0
			Metal.	new(metal_name, bulk_metal_price.to_f/inter_galactic_value.to_i)
		else
			pardon
		end
	end

	def pardon #Message for unknown command
		puts "I have no idea what you are talking about"
	end
	
end
