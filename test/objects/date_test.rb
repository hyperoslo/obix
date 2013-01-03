require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class DateTest < MiniTest::Unit::TestCase

  def test_parses_strings
    object = OBIX.parse fixture "objects/date.xml"

    assert_instance_of OBIX::Objects::Date, object
    assert_equal Date.parse("2007-11-26"), object.val
  end

end
