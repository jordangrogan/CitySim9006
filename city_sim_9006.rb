require_relative "driver.rb"
require_relative "street.rb"
require_relative "avenue.rb"
require_relative "location.rb"

# The pluralize helper method takes in a string and
#   adds the appropriate ending to make it plural
def pluralize(str, num)
  if num == 1
    return str
  else
    if str[-1] == "s" # object[-1] returns last character of string
      return "#{str}es"
    else
      return "#{str}s"
    end
  end
end

# EXECUTION STARTS HERE

raise "Enter a seed and only a seed" unless ARGV.count == 1

prng = Random.new(ARGV[0].to_i) # If it's a string, .to_i will default to 0

# SETUP LOCATIONS & ROADS

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

# RUN SIMULATION

drivers = []
for i in 0..4 do
  drivers[i] = Driver::new("Driver #{i + 1}")
end

drivers.each_with_index do |driver, i|

  nextLocation = nil
  currentLocation = starting_locations.sample(random: prng)

  until (currentLocation == monroeville) || (currentLocation == downtown)

    if currentLocation == hillman
      driver.add_book
    elsif currentLocation == museum
      driver.add_dino
    elsif currentLocation == cathedral
      driver.add_class
    end

    nextRoad = currentLocation.roads.sample(random: prng)
    nextLocation = nextRoad.toLocation(currentLocation)

    puts "Driver #{i + 1} heading from #{currentLocation.name} to #{nextLocation.name} via #{nextRoad.name}"

    currentLocation = nextLocation

  end

  puts "Driver #{i + 1} obtained #{driver.books} #{pluralize("book", driver.books)}!"
  puts "Driver #{i + 1} obtained #{driver.dinos} #{pluralize("dinosaur toy", driver.dinos)}!"
  puts "Driver #{i + 1} attended #{driver.classes} #{pluralize("class", driver.classes)}!"

end
