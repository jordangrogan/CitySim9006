class Avenue

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
