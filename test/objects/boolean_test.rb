require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class BooleanTest < MiniTest::Unit::TestCase

  def test_parses_booleans
    object = OBIX.parse fixture "objects/boolean.xml"

    assert_instance_of OBIX::Objects::Boolean, object
    assert_equal true, object.val
  end

end
