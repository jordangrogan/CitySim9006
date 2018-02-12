require "minitest/autorun"

require_relative "driver"

class DriverTest < Minitest::Test

  def setup
    @d = Driver::new("Test Driver")
  end

  # UNIT TESTS FOR METHOD add_book
  # There are no parameters, it does not make sense to partition it
  def test_add_book
    @d.add_book
    assert_equal @d.books, 1
    @d.add_book
    assert_equal @d.books, 2
  end

  # UNIT TESTS FOR METHOD add_dino
  # There are no parameters, it does not make sense to partition it
  def test_add_dino
    @d.add_dino
    assert_equal @d.dinos, 1
    @d.add_dino
    assert_equal @d.dinos, 2
  end

  # UNIT TESTS FOR METHOD add_class
  # There are no parameters, it does not make sense to partition it
  def test_add_class
    assert_equal @d.classes, 1
    @d.add_class
    assert_equal @d.classes, 2
    @d.add_class
    assert_equal @d.classes, 4
  end

  # UNIT TESTS FOR METHOD pluralize(singularStr, num)
  # Equivalence classes:
  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  # num = 0 && singularStr does not end with s -> returns "#{singularStr}s"
  # num = 1 -> returns singularStr
  # num = 2..INFINITY && singularStr ends with s -> returns "#{singularStr}es"
  # num = 2..INFINITY && singularStr does not end with s -> returns "#{singularStr}s"

  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  def test_pluralize_zero_ends_s
    assert_equal "classes", @d.pluralize("class", 0)
  end

  # num = 0 && singularStr does not end with s -> returns "#{singularStr}s"
  def test_pluralize_zero_not_ends_s
    assert_equal "books", @d.pluralize("book", 0)
  end

  # num = 1 -> returns singularStr
  def test_pluralize_one
    assert_equal "book", @d.pluralize("book", 1)
  end

  # num = 2..INFINITY && singularStr ends with s -> returns "#{singularStr}es"
  def test_pluralize_two_ends_s
    assert_equal "classes", @d.pluralize("class", 2)
  end

  # num = 2..INFINITY && singularStr does not end with s -> returns "#{singularStr}s"
  def test_pluralize_two_not_ends_s
    assert_equal "books", @d.pluralize("book", 2)
  end

  # TODO: Add test for print_results

end
