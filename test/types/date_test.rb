require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class DateTest < MiniTest::Unit::TestCase
  def test_cast
    date = "2007-11-26"

    assert_equal Date.parse(date), OBIX::Types::Date.cast(date)
  end
end
