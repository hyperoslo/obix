require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class ObjectTest < MiniTest::Unit::TestCase

  def test_parses_objects
    object = OBIX.parse string: fixture("objects/object.xml")

    assert_instance_of OBIX::Objects::Object, object
    assert_equal "object", object.name
  end

end
