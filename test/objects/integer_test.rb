require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class IntegerTest < MiniTest::Unit::TestCase

  def test_parses_integers
    object = OBIX.parse fixture "objects/integer.xml"

    assert_instance_of OBIX::Objects::Integer, object
    assert_equal 52, object.val
  end

end
