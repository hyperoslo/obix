require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class BuilderTest < MiniTest::Unit::TestCase
  def test_builds
    xml = fixture "valid.xml"

    obix = OBIX::Builder.new do |obix|
      obix.obj href: "http://myhome/thermostat" do |obix|
        obix.real name: "spaceTemp", unit: "obix:units/fahrenheit", val: 67.2
        obix.real name: "setpoint", unit: "obix:units/fahrenheit", val: 72.0
        obix.bool name: "furnaceOn", val: true
      end
    end

    assert_equal xml.chop, obix.object.to_xml
  end
end
