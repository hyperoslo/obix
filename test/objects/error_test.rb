require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class ErrorTest < MiniTest::Unit::TestCase
  def test_raises_errors
    builder = OBIX::Builder.new do |obix|
      obix.err display: "uh oh"
    end

    assert_raises OBIX::Error do
      builder.object.raise
    end
  end

  def test_raises_bad_uri_errors
    builder = OBIX::Builder.new do |obix|
      obix.err display: "uh oh", is: "obix:BadUriErr"
    end

    assert_raises OBIX::BadURIError do
      builder.object.raise
    end
  end

  def test_raises_unsupported_errors
    builder = OBIX::Builder.new do |obix|
      obix.err display: "uh oh", is: "obix:UnsupportedErr"
    end

    assert_raises OBIX::UnsupportedError do
      builder.object.raise
    end
  end

  def test_raises_permission_errors
    builder = OBIX::Builder.new do |obix|
      obix.err display: "uh oh", is: "obix:PermissionErr"
    end

    assert_raises OBIX::PermissionError do
      builder.object.raise
    end
  end
end
