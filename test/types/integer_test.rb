require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class IntegerTest < MiniTest::Unit::TestCase
  def test_cast
    assert_equal 1, OBIX::Types::Integer.cast("1")
  end
end
