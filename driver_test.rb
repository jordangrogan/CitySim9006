require "minitest/autorun"

require_relative "driver"

class DriverTest < Minitest::Test

  def setup
    @d = Driver::new("Test Driver")
  end

  # UNIT TESTS FOR METHOD add_book()
  # There are no parameters, it does not make sense to partition it
  def test_add_book
    @d.add_book
    assert_equal @d.books, 1
    @d.add_book
    assert_equal @d.books, 2
  end

  # UNIT TESTS FOR METHOD add_dino()
  # There are no parameters, it does not make sense to partition it
  def test_add_dino
    @d.add_dino
    assert_equal @d.dinos, 1
    @d.add_dino
    assert_equal @d.dinos, 2
  end

  # UNIT TESTS FOR METHOD add_class()
  # There are no parameters, it does not make sense to partition it
  def test_add_class
    assert_equal @d.classes, 1
    @d.add_class
    assert_equal @d.classes, 2
    @d.add_class
    assert_equal @d.classes, 4
  end

end
