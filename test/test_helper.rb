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
