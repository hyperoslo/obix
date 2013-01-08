require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class BuilderTest < MiniTest::Unit::TestCase
  def test_builds
    xml = fixture "builder.xml"

    obix = OBIX::Builder.new do |obix|
      obix.obj val: "foo" do |obix|
        obix.obj val: "bar"
        obix.obj val: "baz"
      end
    end

    assert_equal xml.chop, obix.object.to_xml
  end
end
