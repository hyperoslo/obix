require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class BooleanTest < MiniTest::Unit::TestCase

  def test_parses_booleans
    object = OBIX.parse string: fixture("objects/boolean.xml")

    assert_instance_of OBIX::Objects::Boolean, object
    assert_equal true, object.val
    assert_equal "http://example.org/range", object.range
  end

end
