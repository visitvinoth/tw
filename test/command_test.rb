require "test/unit"
require "app/command.rb"
require 'app/libraries.rb'
require "app/inter_galactic_notation.rb"
require "app/metal.rb"

class CommandTest < Test::Unit::TestCase

	def test_load_ign_command
		Command.new("EX is X").process
		ign_value_map = InterGalacticNotation.value_map
		assert_equal 1, ign_value_map.size
		assert_equal "X", ign_value_map["EX"]

		Command.new("EM is M").process
		ign_value_map = InterGalacticNotation.value_map
		assert_equal 2, ign_value_map.size
		assert_equal "M", ign_value_map["EM"]

		Command.new("EM is M MA").process # Improper command
		ign_value_map = InterGalacticNotation.value_map
		assert_equal 2, ign_value_map.size
		assert_equal "M", ign_value_map["EM"]
	end

	def test_load_metal_command
		load_igns
		Command.new("eye eye Bronze is 56 Credits").process
		assert_equal 1, Metal.all.size
		assert_equal "Bronze", Metal.all.first.name
		assert_equal 28, Metal.all.first.price

		Command.new("ell exx Copper is 600 Credits").process
		assert_equal 2, Metal.all.size
		assert_equal "Copper", Metal.all.last.name
		assert_equal 10, Metal.all.last.price
	end

	private
	def load_igns
		Command.new("eye is I").process
		Command.new("wee is V").process
		Command.new("exx is X").process
		Command.new("ell is L").process
	end
end
