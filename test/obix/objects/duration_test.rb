require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class DurationTest < MiniTest::Unit::TestCase

  def test_parses_durations
    object = OBIX.parse string: fixture("objects/duration.xml")

    assert_instance_of OBIX::Objects::Duration, object
    assert_equal 15, object.val
  end

end
