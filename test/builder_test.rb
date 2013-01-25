require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class BuilderTest < MiniTest::Unit::TestCase
  def test_builds
    obix = OBIX::Builder.new do
      obj name: "foo", href: "bar" do
        obj name: "bar" do
          obj name: "baz"
        end
      end
    end

    assert_equal "foo", obix.object.name
    assert_equal "bar", obix.object.objects.first.name
    assert_equal "baz", obix.object.objects.first.objects.first.name
  end

  def test_only_allows_a_single_root_element
    assert_raises ArgumentError do
      obix = OBIX::Builder.new do
        obj name: "foo"
        obj name: "bar"
      end
    end
  end
end
