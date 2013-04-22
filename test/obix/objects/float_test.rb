require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class FloatTest < MiniTest::Unit::TestCase

  def test_parses_floats
    object = OBIX.parse string: fixture("objects/float.xml")

    assert_instance_of OBIX::Objects::Float, object
    assert_equal 41.06, object.val
  end

end
