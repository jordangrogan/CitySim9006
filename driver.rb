class Driver

  def initialize(name)
    @name = name
    @books = 0
    @dinos = 0
    @classes = 1
  end

  def name
    @name
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

  def books
    @books
  end

  def dinos
    @dinos
  end

  def classes
    @classes
  end

end
