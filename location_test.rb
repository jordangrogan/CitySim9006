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

  # UNIT TESTS FOR METHOD getNextRoad(prng)
  # The parameter is a pseudorandom number generator, so it doesn't make sense for their to be equivalence classes
  # The pseudorandom number generator's rand function in this unit test is stubbed
  def test_get_next_road
    prng = Minitest::Mock.new("prng")
    road1 = Minitest::Mock.new("test_road_1")
    road2 = Minitest::Mock.new("test_road_2")
    @l.add_roads(road1, road2)
    def prng.rand(size); 0; end
    assert_equal road1, @l.get_next_road(prng)
    def prng.rand(size); 1; end
    assert_equal road2, @l.get_next_road(prng)
  end

end
