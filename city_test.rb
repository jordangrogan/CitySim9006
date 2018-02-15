require "minitest/autorun"

require_relative "city"

class CityTest < Minitest::Test

  def setup
    @c = City::new
  end

  # UNIT TESTS FOR METHOD add_resource(driver, current_location)
  # Equivalence classes:
  # current_location.name = "Hillman" -> calls add_book
  # current_location.name = "Museum" -> calls add_dino
  # current_location.name = "Cathedral" -> calls add_class

  # If "Hillman" is given for current_location.name, then expect add_book to be called
  def test_add_resource_hillman
    driver = Minitest::Mock.new("Driver")
    location = Minitest::Mock.new("Location")
    def location.name; "Hillman"; end
    driver.expect :add_book, nil
    @c.add_resource(driver, location)
    assert_mock driver
  end

  # If "Museum" is given for current_location.name, then expect add_dino to be called
  def test_add_resource_museum
    driver = Minitest::Mock.new("Driver")
    location = Minitest::Mock.new("Location")
    def location.name; "Museum"; end
    driver.expect :add_dino, nil
    @c.add_resource(driver, location)
    assert_mock driver
  end

  # If "Cathedral" is given for current_location.name, then expect add_class to be called
  def test_add_resource_cathedral
    driver = Minitest::Mock.new("Driver")
    location = Minitest::Mock.new("Location")
    def location.name; "Cathedral"; end
    driver.expect :add_class, nil
    @c.add_resource(driver, location)
    assert_mock driver
  end

  # UNIT TEST FOR METHOD print_route(driver, current_location, next_road, next_location)
  # Equivalence classes do not make sense for this test since it is simply making sure that the names of the objects are printed out
  def test_print_route
    driver = Minitest::Mock.new("Driver")
    current_location = Minitest::Mock.new("Current Location")
    next_road = Minitest::Mock.new("Next Road")
    next_location = Minitest::Mock.new("Next Location")
    def driver.name; "Driver 1"; end
    def current_location.name; "Museum"; end
    def next_road.name; "Bar St."; end
    def next_location.name; "Cathedral"; end
    assert_output("Driver 1 heading from Museum to Cathedral via Bar St.\n") { @c.print_route(driver, current_location, next_road, next_location) }
  end

end
