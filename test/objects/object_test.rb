require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class ObjectTest < MiniTest::Unit::TestCase

  def test_parses_strings
    object = OBIX.parse fixture "thermostat.xml"

    assert_equal "http://myhome/thermostat", object.href

    assert_equal "spaceTemp", object.space_temp.name
    assert_equal 67.2, object.space_temp.val
    assert_equal "obix:units/fahrenheit", object.space_temp.unit

    assert_equal "setpoint", object.setpoint.name
    assert_equal 72.0, object.setpoint.val
    assert_equal "obix:units/fahrenheit", object.setpoint.unit

    assert_equal "furnaceOn", object.furnace_on.name
    assert_equal true, object.furnace_on.val
  end

end
