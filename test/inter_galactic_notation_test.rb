 require "test/unit"
 require "app/inter_galactic_notation.rb"
 require 'app/libraries.rb'
  class InterGalacticNotationTest < Test::Unit::TestCase
    def setup
      InterGalacticNotation.feed_value_map("EYE", "I")
      InterGalacticNotation.feed_value_map("EX", "X")
      InterGalacticNotation.feed_value_map("WEE", "V")
      InterGalacticNotation.feed_value_map("ELL", "L")
    end
    def test_ign_creation_and_validity
      assert_equal false, InterGalacticNotation.new("blah blah").valid?
      assert_equal true, InterGalacticNotation.new("ELL WEE").valid?
      assert_equal false, InterGalacticNotation.new("ELL wee").valid?
      assert_equal false, InterGalacticNotation.new("WEE ELL").valid?
    end
    def test_ign_integer_conversion
      assert_equal 55, InterGalacticNotation.new("ELL WEE").to_i
      assert_equal 45, InterGalacticNotation.new("EX ELL WEE").to_i
    end
    def test_ign_roman_conversion
      assert_equal "LV", InterGalacticNotation.new("ELL WEE").to_roman
      assert_equal "XLV", InterGalacticNotation.new("EX ELL WEE").to_roman
    end

    def test_parse_and_get_inter_galactic_sub_string
      assert_equal nil, InterGalacticNotation.parse_and_get_inter_galactic_sub_string("KAT ELL WEE EX RAM")
      assert_equal "LV", InterGalacticNotation.parse_and_get_inter_galactic_sub_string("KAT ELL WEE RAM").to_roman
      assert_equal "LXVI", InterGalacticNotation.parse_and_get_inter_galactic_sub_string("KAT ELL EX WEE EYE RAM").to_roman
    end
  end
