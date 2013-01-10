require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class DateTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::Date.new @object
  end
  
  def test_cast
    date = "2007-11-26"

    assert_equal Date.parse(date), @type.cast(date)
  end
end
