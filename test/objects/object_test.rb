require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class ObjectTest < MiniTest::Unit::TestCase

  def test_parses
    thermostat = OBIX.parse fixture "thermostat.xml"

    assert_equal "http://myhome/thermostat", thermostat.href

    temperature = thermostat.objects.find { |obj| obj.name == "spaceTemp" }

    assert_equal 67.2, temperature.val
    assert_equal "obix:units/fahrenheit", temperature.unit
  end

  def test_serializes_to_string
    thermostat = OBIX.parse fixture "thermostat.xml"

    assert_equal "#<OBIX::Objects::Object href: \"http://myhome/thermostat\">", thermostat.to_s
  end

end
