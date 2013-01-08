require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class ObjectsTest < MiniTest::Unit::TestCase
  def test_list
    assert_equal 11, OBIX::Objects.list.size
  end
end
