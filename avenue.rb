class Avenue

  # An Avenue is a road that has three locations on it:
  # location1, location2, location3,
  # in the order that they can be traversed.
  # That is, location1 can go to location2 and
  # location2 can go to location3.

  attr_accessor :name

  def initialize(name, location1, location2, location3)
    @name = name
    @location1 = location1
    @location2 = location2
    @location3 = location3
  end

  def to_location(fromLocation)
    if fromLocation == @location1
      @location2
    elsif fromLocation == @location2
      @location3
    end
  end

end
