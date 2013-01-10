require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class TimeTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::Time.new @object
  end
  
  def test_cast
    time = "2005-03-09T13:30:00Z"

    assert_equal Time.parse(time), @type.cast(time)
  end
end
