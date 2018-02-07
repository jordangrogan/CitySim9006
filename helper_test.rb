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
  # num = not a number -> returns exception

  # num = 0 && singularStr ends with s -> returns "#{singularStr}es"
  def test_pluralize_zero_ends_s
    assert_equal "classes", pluralize("class", 0)
  end

end
