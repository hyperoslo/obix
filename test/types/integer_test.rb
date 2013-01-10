require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class IntegerTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::Integer.new @object
  end
  
  def test_cast
    assert_equal 1, @type.cast("1")
  end
end
