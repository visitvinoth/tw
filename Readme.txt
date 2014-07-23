Inter-Galactic Currency Calculator!!!
~~~~~~~~~~~~~~~~~~~~~~~~~~~

User Guide:
~~~~~~~~~~~

Run the program as 'ruby init.rb'

The program takes three types of commands:

1. Set roman numeral equation
		Ex: "glob is I"
2. Load metal value
		Ex: "glob glob Silver is 34 Credits"
		'glob glob' will be read as the inter-galactic number and the metal silver will be added to found-metal-list with it unit price as 17
3. Value question
		Ex: "how much is pish tegj glob glob ?"
		The evaluates the inmter-galactic string "pish tegj glob glob" and give its numeric value
4. Metal price question
		Ex: "how many Credits is glob prok Iron ?"
		This evaluates the inmter-galactic string "glob prok Iron" and print how much such units of the metal Iron would cost in numeric value.

Commands in other format will not be recognized.



Technical Details:
~~~~~~~~~~~~~
a. The class InterGalacticNotation, represents the inter-galactic value. This has relevant methods to manipulate itself. Its class variable @@value_map has all the entered inter-galactic to roman mappings

b. The class Metal, represents the metals. A metal object will have a name and unit price. Its class variable @@metals has all the found metal objects. 

c. The class Command does the command processing
		The three types of commands are parsed by process method of this class. 
		1. Set roman numeral equation
			If the command looks like "glob is I", we add the mapping ['glob' =>  'I'] to the class variable @@value_map of the class InterGalacticNotation. 
		2. Load metal value
			If the metal looks like "glob glob Silver is 34 Credits", we parse the inter-galactic string metal name and the unit-price and create a metal object and will add it to Metal's @@all_metals.
		3. Parsing quesion
			If this is a question starting with 'how', we parse it and evaluate the inter-galactic string, metal and out out accordingly.

d. libraries.rb added few more functionality to the classes Fixnum and String
