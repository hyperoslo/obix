require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class DurationTest < MiniTest::Unit::TestCase
  def test_cast
    assert_equal 15, OBIX::Types::Duration.cast("PT15S")
  end
end
