require_relative "driver"
require_relative "street"
require_relative "avenue"
require_relative "location"

class City

  def initialize()

    # SETUP LOCATIONS & ROADS & DRIVERS

    @hospital = Location::new("Hospital")
    @cathedral = Location::new("Cathedral")
    @monroeville = Location::new("Monroeville")
    @museum = Location::new("Museum")
    @hillman = Location::new("Hillman")
    @downtown = Location::new("Downtown")

    @starting_locations = [@hospital, @cathedral, @museum, @hillman]

    @foo = Street::new("Foo St.", @hospital, @hillman)
    @bar = Street::new("Bar St.", @cathedral, @museum)
    @fourth = Avenue::new("Fourth Ave.", @hospital, @cathedral, @monroeville)
    @fifth = Avenue::new("Fifth Ave.", @museum, @hillman, @downtown)

    @hospital.add_roads(@foo, @fourth)
    @cathedral.add_roads(@bar, @fourth)
    @hillman.add_roads(@foo, @fifth)
    @museum.add_roads(@bar, @fifth)

    @drivers = []
    for i in 0..4 do
      @drivers[i] = Driver::new("Driver #{i + 1}")
    end

  end

  def run(prng)

    @drivers.each_with_index do |driver, i|

      currentLocation = @starting_locations.sample(random: prng)

      until (currentLocation == @monroeville) || (currentLocation == @downtown)

        add_resource(driver, currentLocation)

        nextRoad = currentLocation.get_next_road(prng)
        nextLocation = nextRoad.to_location(currentLocation)

        print_route(driver, currentLocation, nextRoad, nextLocation)

        currentLocation = nextLocation

      end

      driver.print_results

    end

  end

  def add_resource(driver, currentLocation)
    if currentLocation.name == "Hillman"
      driver.add_book
    elsif currentLocation.name == "Museum"
      driver.add_dino
    elsif currentLocation.name == "Cathedral"
      driver.add_class
    end
  end

  def print_route(driver, currentLocation, nextRoad, nextLocation)
    puts "#{driver.name} heading from #{currentLocation.name} to #{nextLocation.name} via #{nextRoad.name}"
  end

end
