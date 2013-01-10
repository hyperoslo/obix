require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class BaseTest < MiniTest::Unit::TestCase
  def test_parses_valid_obix
    thermostat = OBIX.parse file: "test/fixtures/valid.xml"

    assert_equal "http://myhome/thermostat", thermostat.href

    temperature = thermostat.objects.find { |obj| obj.name == "spaceTemp" }

    assert_equal thermostat, temperature.parent
    assert_equal 67.2, temperature.val
    assert_equal "obix:units/fahrenheit", temperature.unit
  end

  def test_fails_to_parse_invalid_obix
    assert_raises OBIX::Objects::UnknownObjectError do
      unknown = OBIX.parse file: "test/fixtures/invalid.xml"
    end
  end

  def test_serializes_to_string
    thermostat = OBIX.parse file: "test/fixtures/valid.xml"

    assert_equal "#<OBIX::Objects::Object href: \"http://myhome/thermostat\">", thermostat.to_s
  end

  def test_serializes_to_xml
    xml = fixture "valid.xml"

    thermostat = OBIX.parse string: xml

    assert_equal xml, thermostat.to_xml
  end
end
