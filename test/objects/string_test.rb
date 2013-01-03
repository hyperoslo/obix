require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class StringTest < MiniTest::Unit::TestCase

  def test_parses_strings
    object = OBIX.parse fixture "objects/string.xml"

    assert_instance_of OBIX::Objects::String, object
    assert_equal "hello world", object.val
  end

end
