require "minitest/autorun"

require_relative "street"

class StreetTest < Minitest::Test

  # UNIT TESTS FOR METHOD toLocation(fromLocation)
  # Equivalence classes:
  # toLocation = location1 -> returns location2
  # toLocation = location2 -> returns location1

  # If location1 is given for input toLocation, location2 is returned
  def test_loc1_to_loc2
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    avenue = Street::new("Foo", loc1, loc2)
    assert_equal loc2, avenue.toLocation(loc1)
  end

  # If location2 is given for input toLocation, location3 is returned
  def test_loc2_to_loc1
    loc1 = Minitest::Mock.new("Location 1")
    loc2 = Minitest::Mock.new("Location 2")
    avenue = Street::new("Foo", loc1, loc2)
    assert_equal loc1, avenue.toLocation(loc2)
  end

end
