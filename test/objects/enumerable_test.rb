require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class EnumerableTest < MiniTest::Unit::TestCase

  def test_parses_enumerables
    object = OBIX.parse fixture "objects/enumerable.xml"

    assert_instance_of OBIX::Objects::Enumerable, object
    assert_equal "/enums/OffSlowFast", object.range
    assert_equal "slow", object.val
  end

end
