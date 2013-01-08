require "obix"
require "minitest/unit"
require "minitest/autorun"
require "nokogiri"
require "active_support/all"

require "test_helper"

class TagTest < MiniTest::Unit::TestCase

  class Dummy
    include OBIX

    extend Tag

    tag :dummy

    attribute :string, type: Types::String
    attribute :integer, type: Types::Integer
    attribute :float, type: Types::Float
    attribute :boolean, type: Types::Boolean
    attribute :default, default: "default"

    def initialize attributes = {}
      @attributes = attributes
    end
  end

  def test_creates_tag_method
    test = Dummy.new

    assert_equal :dummy, test.tag
  end

  def test_creates_access_method
    test = Dummy.new "string" => "string"

    assert test.string
  end

  def test_casts_strings
    test = Dummy.new "string" => "string"

    assert_equal "string", test.string
  end

  def test_casts_integers
    test = Dummy.new "integer" => "1"

    assert_equal 1, test.integer
  end

  def test_casts_floats
    test = Dummy.new "float" => "1.0"

    assert_equal 1.0, test.float
  end

  def test_casts_booleans
    test = Dummy.new "boolean" => "true"

    assert_equal true, test.boolean
  end

  def test_defaults
    test = Dummy.new

    assert_equal "default", test.default
  end
end
