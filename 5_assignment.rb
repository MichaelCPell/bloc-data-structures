# Part 1
require 'Prime'

class SeperateChaining
	def initialize
		@prime_generator = Prime::EratosthenesGenerator.new
		@array = Array.new(@prime_generator.next)
	end


	def hash(key)
		if key.is_a? String
			hashed_value = 0
			
			key.split("").each do |letter|
				hashed_value = hashed_value + letter.ord
			end
		end

		hashed_value
	end

	def get_index(key)
		hash(key) % @array.length
	end


	def []=(key, value)	
		index = hash(key) % @array.length
		@array[index] ||= []
		@array[index] << [key, value]

		new_load_factor = @array.flatten(1).compact.length / @array.length.to_f

		p "New Load Factor: #{new_load_factor}"
		if new_load_factor  > 0.7
			resize
		end
	end

	def [](key)
		index = get_index(key)

		@array[index].each do |pair|
			if pair[0] == key
				return pair[1]
			end
		end
	end

	def resize
		new_value = @prime_generator.next
		puts "resizing to #{new_value}"
		old_copy = @array
		
		@array = Array.new(new_value)

		tuples = old_copy.flatten(1).compact
		tuples.each do |tuple|
			self[tuple[0]] = tuple[1]
		end

	end

	def inspect
		p @array.inspect
	end
end



foo = SeperateChaining.new
foo["cat"] = "bar"
foo["dog"] = "andrea"
foo["andrea"] = "girl"
foo["a"] = "a"
foo["b"] = "b"
foo["c"] = "c"
foo["d"] = "d"


p foo["cat"]
p foo["d"]
