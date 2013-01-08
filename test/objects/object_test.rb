require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class ObjectTest < MiniTest::Unit::TestCase

  def test_parses
    thermostat = OBIX.parse string: fixture("thermostat.xml")

    assert_equal "http://myhome/thermostat", thermostat.href

    temperature = thermostat.objects.find { |obj| obj.name == "spaceTemp" }

    assert_equal 67.2, temperature.val
    assert_equal "obix:units/fahrenheit", temperature.unit
  end

  def test_serializes_to_string
    thermostat = OBIX.parse string: fixture("thermostat.xml")

    assert_equal "#<OBIX::Objects::Object href: \"http://myhome/thermostat\">", thermostat.to_s
  end

  def test_serializes_to_xml
    xml = fixture "thermostat.xml"

    thermostat = OBIX.parse string: xml

    assert_equal xml.chop, thermostat.to_xml
  end

  def test_constructs
    object = OBIX::Objects::Object.new foo: "bar"

    assert_equal "<obj foo=\"bar\"/>", object.to_xml
  end

end
