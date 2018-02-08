class Driver

  attr_accessor :name, :books, :dinos, :classes

  def initialize(name)
    @name = name
    @books = 0
    @dinos = 0
    @classes = 1
  end

  def add_book
    @books += 1
  end

  def add_dino
    @dinos += 1
  end

  def add_class
    @classes *= 2
  end

end
