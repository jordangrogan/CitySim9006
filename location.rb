class Location

  def initialize(name)
    @name = name
    @roads = [] # @roads are streets or avenues that this location can travel to
  end

  def add_roads(*rds)
    rds.each { |r| @roads << r }
  end

  def roads
    @roads
  end

  def name
    @name
  end

end
