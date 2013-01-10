require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class BooleanTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::Boolean.new @object
  end
  
  def test_cast
    assert_equal true, @type.cast("true")
  end
end
