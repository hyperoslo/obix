require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class TagTest < MiniTest::Unit::TestCase
  class Dummy < OBIX::Objects::Base
    tag :dummy

    attribute :foo, type: OBIX::Types::String
    attribute :default, default: "default"
  end

  def test_tag
    dummy = Dummy.new

    assert_equal :dummy, dummy.tag
  end

  def test_attribute
    dummy = Dummy.new foo: "foo"

    assert_equal "foo", dummy.foo
  end

  def test_default_attribute
    dummy = Dummy.new

    assert_equal "default", dummy.default
  end
end
