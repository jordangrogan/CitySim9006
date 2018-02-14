require "minitest/autorun"

require_relative "city"

class CityTest < Minitest::Test

  def setup
    @c = City::new
  end

  # UNIT TESTS FOR METHOD add_resource(driver, currentLocation)
  # Equivalence classes:
  # currentLocation.name = "Hillman" -> calls add_book
  # currentLocation.name = "Museum" -> calls add_dino
  # currentLocation.name = "Cathedral" -> calls add_class

  # If "Hillman" is given for currentLocation.name, then expect add_book to be called
  def test_add_resource_hillman
    driver = Minitest::Mock.new("Driver")
    location = Minitest::Mock.new("Location")
    def location.name; "Hillman"; end
    driver.expect :add_book, nil
    @c.add_resource(driver, location)
    assert_mock driver
  end

  # If "Museum" is given for currentLocation.name, then expect add_dino to be called
  def test_add_resource_museum
    driver = Minitest::Mock.new("Driver")
    location = Minitest::Mock.new("Location")
    def location.name; "Museum"; end
    driver.expect :add_dino, nil
    @c.add_resource(driver, location)
    assert_mock driver
  end

  # If "Cathedral" is given for currentLocation.name, then expect add_class to be called
  def test_add_resource_cathedral
    driver = Minitest::Mock.new("Driver")
    location = Minitest::Mock.new("Location")
    def location.name; "Cathedral"; end
    driver.expect :add_class, nil
    @c.add_resource(driver, location)
    assert_mock driver
  end

end
