 require "test/unit"
 require "app/metal.rb"
  class MetalTest < Test::Unit::TestCase
    def test_metal_creation_and_identification
      silver = Metal.new("silver", 100)
      assert_nil Metal.parse_and_get_metal_object("asdas asdasd asdasdas")
      assert_equal silver, Metal.parse_and_get_metal_object("asdas asdasd asdasdas silver asdsde")
    end
  end
