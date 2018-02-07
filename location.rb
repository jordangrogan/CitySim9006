class Location

  def initialize(name)
    @name = name
    @roads = []
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
