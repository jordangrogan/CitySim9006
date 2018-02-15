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
    add_drivers

  end

  def run(prng)

    @drivers.each do |driver|

      traverse_city(prng, driver)

      driver.print_results

    end

  end

  def add_drivers
    for i in 0..4 do
      @drivers[i] = Driver::new("Driver #{i + 1}")
    end
  end

  def traverse_city(prng, driver)

    rand_val = prng.rand(@starting_locations.size)
    current_location = @starting_locations[rand_val]

    until (current_location == @monroeville) || (current_location == @downtown)

      add_resource(driver, current_location)

      next_road = current_location.get_next_road(prng)
      next_location = next_road.to_location(current_location)

      print_route(driver, current_location, next_road, next_location)

      current_location = next_location

    end

  end

  def add_resource(driver, current_location)
    if current_location.name == "Hillman"
      driver.add_book
    elsif current_location.name == "Museum"
      driver.add_dino
    elsif current_location.name == "Cathedral"
      driver.add_class
    end
  end

  def print_route(driver, current_location, next_road, next_location)
    puts "#{driver.name} heading from #{current_location.name} to #{next_location.name} via #{next_road.name}"
  end

end
