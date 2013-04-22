require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class FloatTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::Float.new @object
  end
  
  def test_cast
    assert_equal 25.5, @type.cast("25.5")
  end
end
