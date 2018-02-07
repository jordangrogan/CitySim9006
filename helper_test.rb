require "minitest/autorun"

require_relative "helper"

class HelperTest < Minitest::Test

  # UNIT TESTS FOR METHOD pluralize(singularStr, num)
  # Equivalence classes:
  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  # num = 0 && singularStr does not end with s -> returns "#{singularStr}s"
  # num = 1 -> returns singularStr
  # num = 2..INFINITY && singularStr ends with s -> returns "#{singularStr}es"
  # num = 2..INFINITY && singularStr does not end with s -> returns "#{singularStr}s"

  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  def test_pluralize_zero_ends_s
    assert_equal "classes", pluralize("class", 0)
  end

  # num = 0 && singularStr does not end with s -> returns "#{singularStr}s"
  def test_pluralize_zero_not_ends_s
    assert_equal "books", pluralize("book", 0)
  end

  # num = 1 -> returns singularStr
  def test_pluralize_one
    assert_equal "book", pluralize("book", 1)
  end

  # num = 2..INFINITY && singularStr ends with s -> returns "#{singularStr}es"
  def test_pluralize_two_ends_s
    assert_equal "classes", pluralize("class", 2)
  end

  # num = 2..INFINITY && singularStr does not end with s -> returns "#{singularStr}s"
  def test_pluralize_two_not_ends_s
    assert_equal "books", pluralize("book", 2)
  end

end
