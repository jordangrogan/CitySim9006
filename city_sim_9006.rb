class Driver

	@currentLocation = nil
	@name = nil

	def initialize name
		@name = name
	end

	def setCurrentLocation currentLocation
		@currentLocation = currentLocation
	end

	def currentLocation
		@currentLocation
	end

	def name
		@name
	end

end

class Street

	@name = nil
	@location1 = nil
	@location2 = nil

	def initialize name, location1, location2
		@name = name
		@location1 = location1
		@location2 = location2
	end

	def name
		@name
	end

	def toLocation fromLocation
		if fromLocation == @location1
			@location2
		elsif fromLocation == @location2 # Two-Way Streets
			@location1
		end
	end

end

class Avenue

	@name = nil
	@location1 = nil
	@location2 = nil
	@location3 = nil

	def initialize name, location1, location2, location3
		@name = name
		@location1 = location1
		@location2 = location2
		@location3 = location3
	end

	def name
		@name
	end

	def toLocation fromLocation
		if fromLocation == @location1
			@location2
		elsif fromLocation == @location2
			@location3
		end
	end

end

class Location

	@name = nil
	@roads = nil # Roads able to travel

	def initialize name
		@name = name
		@roads = []
	end

	def add_roads(*rds)
		rds.each { |r| @roads << r }
	end

	def roads
		@roads
	end

	def name
		@name
	end

end


# EXECUTION STARTS HERE

raise "Enter a seed and only a seed" unless ARGV.count == 1

prng = Random.new(ARGV[0].to_i) # If it's a string, .to_i will default to 0

# SETUP

hospital = Location::new("Hospital")
cathedral = Location::new("Cathedral")
monroeville = Location::new("Monroeville")
museum = Location::new("Museum")
hillman = Location::new("Hillman")
downtown = Location::new("Downtown")

starting_locations = [hospital, cathedral, museum, hillman]

foo = Street::new("Foo St.", hospital, hillman)
bar = Street::new("Bar St.", cathedral, museum)
fourth = Avenue::new("Fourth Ave.", hospital, cathedral, monroeville)
fifth = Avenue::new("Fifth Ave.", museum, hillman, downtown)

hospital.add_roads(foo, fourth)
cathedral.add_roads(bar, fourth)
hillman.add_roads(foo, fifth)
museum.add_roads(bar, fifth)

drivers = []
for i in 0..4 do
	drivers[i] = Driver::new("Driver " + (i+1).to_s)
end

drivers.each_with_index do |driver, i|

	nextLocation = nil
	currentLocation = driver.setCurrentLocation(starting_locations.sample(random: prng))

	until (nextLocation == monroeville) || (nextLocation == downtown)
		nextRoad = currentLocation.roads.sample(random: prng)
		nextLocation = nextRoad.toLocation(currentLocation)
		puts("Driver " + (i+1).to_s + " heading from " + currentLocation.name + " to " + nextLocation.name + " via " + nextRoad.name)
		currentLocation = nextLocation
	end

end
