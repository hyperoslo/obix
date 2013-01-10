require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class DurationTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::Duration.new @object
  end
  
  def test_cast
    assert_equal 15, @type.cast("PT15S")
  end
end
