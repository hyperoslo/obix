require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class BooleanTest < MiniTest::Unit::TestCase
  def test_cast
    assert_equal true, OBIX::Types::Boolean.cast("true")
  end
end
