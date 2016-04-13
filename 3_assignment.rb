# Part 1

class PellHash
	def initialize
		@keys = Array.new(10)
		@values = Array.new(10)
	end


	def []=(key, value)
		if key.is_a? String
			hashed_value = 0
			key.split("").each do |letter|
				hashed_value = hashed_value + letter.ord
			end
			
			index = hashed_value % @keys.length
			if @values[index].nil?
				@keys[index] = key
				@values[index] = value
			else
				# Stub Method to Recalculate Everything
			end
		end
	end

	def [](key)
		index = @keys.index(key)

		p @values[index]
	end

	def inspect
		puts @keys
		puts @values
	end
end



foo = PellHash.new
foo["cat"] = "bar"
foo["dog"] = "andrea"
foo["andrea"] = "girl"

foo["andrea"]



#part 2

=begin
	Provide the size and state of the internal hash array after each insertion.
	List the value at every index in the array.
	Provide the length of the array, or k.
	Assume the hash was empty beforehand and we initialized it with k equal to 5.
=end
lotr_runtimes ={}
#1
lotr_runtimes["The Lord of the Rings: The Fellowship of the Ring"] = "3 hours, 48 minutes";

k=1
["3 hours, 48 minutes"]
9386720683

#2
lotr_runtimes["The Lord of the Rings: The Two Towers"] = "3 hours, 55 minutes";
5673950932

k=2
["3 hours, 55 minutes", "3 hours, 48 minutes"]


#3
# “The Lord of the Rings: The Return of the King”	“3 hours, 21 minutes”	8677341966
k = 5
["3 hours, 21 minutes","3 hours, 55 minutes","3 hours, 48 minutes",,]

#4 
“The Hobbit: An Unexpected Journey”	“3 hours, 2 minutes”	3258097344
k = 5
[,"3 hours, 21 minutes","3 hours, 55 minutes","3 hours, 48 minutes","3 hours, 2 minutes"]


#5
# Okay I get it



