require "minitest/autorun"

require_relative "location"

class LocationTest < Minitest::Test

  def setup
    @l = Location::new("Test Location")
  end

  # UNIT TESTS FOR METHOD add_roads(*roads)
  # Equivalence classes:
  # Number of roads = 1
  # Number of roads > 1

  # Number of roads = 1
  def test_add_roads_one
    road1 = Minitest::Mock.new("test_road_1")
    @l.add_roads(road1)
    assert_includes @l.roads, road1
  end

  # Number of roads > 1
  def test_add_roads_more_than_one
    road1 = Minitest::Mock.new("test_road_1")
    road2 = Minitest::Mock.new("test_road_2")
    @l.add_roads(road1, road2)
    assert_includes @l.roads, road1
    assert_includes @l.roads, road2
  end

  # UNIT TESTS FOR METHOD get_next_road(prng)
  # The parameter is a pseudorandom number generator, so it doesn't make sense for their to be equivalence classes
  def test_get_next_road
    road1 = Minitest::Mock.new("test_road_1")
    road2 = Minitest::Mock.new("test_road_2")
    @l.add_roads(road1, road2)
    assert_includes [road1, road2], @l.get_next_road(Random.new)
    # Is it okay to use Random.new in this case??
  end

end
