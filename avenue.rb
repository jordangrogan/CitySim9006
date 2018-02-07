class Avenue

  def initialize(name, location1, location2, location3)
    @name = name
    @location1 = location1
    @location2 = location2
    @location3 = location3
  end

  def name
    @name
  end

  def toLocation(fromLocation)
    if fromLocation == @location1
      @location2
    elsif fromLocation == @location2
      @location3
    end
  end

end
