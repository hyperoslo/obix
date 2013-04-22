require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class ReferenceTest < MiniTest::Unit::TestCase

  def test_parses_references
    object = OBIX.parse file: "test/fixtures/objects/reference.xml"

    assert_instance_of OBIX::Objects::Reference, object
    assert_equal "http://obix.org/", object.href
  end

end
