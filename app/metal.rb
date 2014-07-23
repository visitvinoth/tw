class Metal #class to represent metals with their unit prices
	attr_accessor :name, :price
	@@metals = []  # Class variablt to save all found metals
	def initialize(name, price)
		@name = name
		@price = price
		@@metals << self
	end
	def self.all
		@@metals
	end
	def self.parse_and_get_metal_object(str) # Checks whether any word in the string matches with found metals and returns its object if found.
		str_arr = str.split
		@@metals.detect { |metal|  str_arr.include? metal.name}
	end
end
