class Street

  attr_accessor :name

  def initialize(name, location1, location2)
    @name = name
    @location1 = location1
    @location2 = location2
  end

  def toLocation(fromLocation)
    if fromLocation == @location1
      @location2
    elsif fromLocation == @location2 # Two-Way Streets
      @location1
    end
  end

end
