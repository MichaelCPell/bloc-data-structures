####################################################################################################################################################################################################################################

# (1) A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.class LineTracker
class LineTracker
	attr_accessor :line

	def initialize
		line = []
	end

	def front
		line.first
	end

	def back
		line.last
	end

	def leave(pos)
		line.delete_at(pos)
	end

	def add_to_line(person)
		line.push(person)
	end
end

# How does your data structure allow developers to access and manipulate the data?
=begin

Exposes `front`, `back`, `leave`, and `add_to_line`


=end
# If a developer wanted to find a specific element in your data structure, how would you search for it?
=begin
Given the context of this data structure's use, the `front` method is sufficient to provide a reasonable interface for how the line ought to be interacted with.

=end

# What other real-world data can each structure represent?
=begin
This data structure could be use anywhere that a 'first in, first out' queue exists, such as food I have eaten or cars in a traffic jam.
=end
####################################################################################################################################################################################################################################
=begin
(2)
Pixels on a computer screen
Pixels require three color values: red, green, and blue.
Pixels also require a coordinate location: x and y.
=end
class Matrix
	attr_accessor :width, :height
	attr_accessor :matrix

	def initialize
		@width, @height = 0,0
		@matrix = []
	end

	def set_color(x, y, color)
		return "Unknown Color" unless %w(red green blue).include? color

		@width = x if x > width

		row = @matrix[y] ||= []
		row[x] = color
	end

	def get_pixel(x,y)
		return row[y][x]
	end

	def print_matrix
		@matrix.each do |row|
			row ||= []

			0.upto(@width) do |i|
				row[i] ||= "blank"
			end

			p row.map {|x| x.nil? ? x = "blank" : x}
		end
	end
end

=begin
How does your data structure allow developers to access and manipulate the data?
`set_color` lets you set a specific pixel.  `print_matrix` lets you see the current printout of the screen.

If a developer wanted to find a specific element in your data structure, how would you search for it?
`get_pixel` provides an interface for retrieving a pixel at a specific x,y coordinate.

What other real-world data can each structure represent?
This could be repurposed for any sort of 2d imagine
=end
####################################################################################################################################################################################################################################
=begin
(3)
The geo-location of every person on Earth
Latitude and longitude mark the location of each person on Earth.
The smallest surface area is one square meter.
Two or more people may inhabit the same position, e.g. two people hugging, two or more people on different floors of the same building, or two children standing on each other's shoulders pretending to be an adult.
=end


class GeoRaster
	attr_accessor :tiles

	def initialize
		tiles = #some source of GeoTiles
	end

	def find_tile(lat, long)
		tiles.each do |tile|
			if lat >= tile.min_lat && lat <= tile.max_lat
				if long >= tile.min_long && long <= tile.max_long
					return tile
				end
			end
		end
	end

	def add_person(lat,long, person)
		tile = find_tile(lat, long)
		tile.people << person
	end
end

class GeoTile
	attr_accessor :min_lat, :max_lat, :min_long, :min_long, :people

	def initialize
		people = []
	end
end

=begin
How does your data structure allow developers to access and manipulate the data?
Provides an interface to `find_tile` which require a lat and long.  `find_tile` then looks for the first matching tile and returns it.  `add_person` references `find_tile`, and goes one step further by taking a `person` as an argument and pushing that person onto the found tile's `people` array attribute.

If a developer wanted to find a specific element in your data structure, how would you search for it?
`find_tile`

What other real-world data can each structure represent?
`GeoRaster` might end up being a fairly specific class as geographic coordinate systems are unique.  But the payload(i.e. buildings instead of people) of each tile could easily change, as well as the anticipated dimensions of the tiles.
=end