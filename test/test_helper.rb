require "mocha/setup"

OBIX.configure do |config|
  config.scheme = "http"
  config.host = "example.org"
end

class MiniTest::Unit::TestCase

  # Read the given fixture.
  #
  # path - A String describing the path to the fixture.
  #
  # Return the fixture as a String.
  def fixture path
    File.read "test/fixtures/#{path}"
  end
end
