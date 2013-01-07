require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class ListTest < MiniTest::Unit::TestCase

  def test_parses_booleans
    object = OBIX.parse string: fixture("objects/list.xml")

    assert_instance_of OBIX::Objects::List, object
    assert_equal "obix:str", object.of
    assert_equal 2, object.objects.size
  end

end
