require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class OBIXTest < MiniTest::Unit::TestCase
  def test_parses_from_string
    xml = fixture "thermostat.xml"

    object = OBIX.parse string: xml

    assert_instance_of OBIX::Objects::Object, object
  end

  def test_parses_from_url
    xml = fixture "thermostat.xml"

    Net::HTTP.get.stubs(:get).returns(xml)

    object = OBIX.parse url: "http://domain/thermostat"

    assert_instance_of OBIX::Objects::Object, object
  end

  def test_parses_from_url
    xml = fixture "thermostat.xml"

    File.stubs(:read).returns(xml)

    object = OBIX.parse file: "thermostat.xml"

    assert_instance_of OBIX::Objects::Object, object
  end
end
