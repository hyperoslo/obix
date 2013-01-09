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
      obix.obj name: "foo", href: "bar" do |obix|
        obix.obj name: "bar" do |obix|
          obix.obj name: "baz"
        end
      end
    end

    assert_equal "foo", obix.object.name
    assert_equal "bar", obix.object.objects.first.name
    assert_equal "baz", obix.object.objects.first.objects.first.name
  end
end
