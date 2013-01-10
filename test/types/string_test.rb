require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class StringTest < MiniTest::Unit::TestCase
  def setup
    @object = OBIX::Objects::Object.new
    @type   = OBIX::Types::String.new @object
  end
  
  def test_cast
    assert_equal "foo", @type.cast("foo")
  end
end
