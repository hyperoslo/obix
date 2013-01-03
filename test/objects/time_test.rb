require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class TimeTest < MiniTest::Unit::TestCase

  def test_parses_strings
    object = OBIX.parse fixture "objects/time.xml"

    assert_instance_of OBIX::Objects::Time, object
    assert_equal Time.parse("2005-03-09 13:30:00 UTC"), object.val
  end

end
