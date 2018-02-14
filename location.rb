class Location

  attr_accessor :name, :roads

  def initialize(name)
    @name = name
    @roads = [] # @roads are streets or avenues that this location can travel to
  end

  def add_roads(*rds)
    rds.each { |r| @roads << r }
  end

  def get_next_road(prng)
    @roads.sample(random: prng)
  end

end
