require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class OBIXTest < MiniTest::Unit::TestCase
  def test_parses_from_string
    xml = fixture "valid.xml"

    object = OBIX.parse string: xml

    assert_instance_of OBIX::Objects::Object, object
  end

  def test_parses_from_url
    xml = fixture "valid.xml"

    Net::HTTP.
      stubs(
        :start
      ).
      returns(
        stub body: xml
      )

    object = OBIX.parse url: "http://domain/thermostat"

    assert_instance_of OBIX::Objects::Object, object
  end

  def test_parses_from_file
    xml = fixture "valid.xml"

    File.stubs(:read).returns(xml)

    object = OBIX.parse file: "valid.xml"

    assert_instance_of OBIX::Objects::Object, object
  end
end
