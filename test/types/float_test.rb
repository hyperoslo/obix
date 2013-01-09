require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class FlaotTest < MiniTest::Unit::TestCase
  def test_cast
    assert_equal 25.5, OBIX::Types::Float.cast("25.5")
  end
end
