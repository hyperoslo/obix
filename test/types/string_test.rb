require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class StringTest < MiniTest::Unit::TestCase
  def test_cast
    assert_equal "foo", OBIX::Types::String.cast("foo")
  end
end
