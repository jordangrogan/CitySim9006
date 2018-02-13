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

      nextLocation = nil
      currentLocation = @starting_locations.sample(random: prng)

      until (currentLocation == @monroeville) || (currentLocation == @downtown)

        if currentLocation == @hillman
          driver.add_book
        elsif currentLocation == @museum
          driver.add_dino
        elsif currentLocation == @cathedral
          driver.add_class
        end

        nextRoad = currentLocation.getNextRoad(prng)
        nextLocation = nextRoad.toLocation(currentLocation)

        puts "Driver #{i + 1} heading from #{currentLocation.name} to #{nextLocation.name} via #{nextRoad.name}"

        currentLocation = nextLocation

      end

      driver.print_results

    end

  end

end
