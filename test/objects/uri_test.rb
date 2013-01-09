require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class URITest < MiniTest::Unit::TestCase

  def test_parses_uris
    object = OBIX.parse file: "test/fixtures/objects/uri.xml"

    assert_instance_of OBIX::Objects::URI, object
    assert_equal "http://obix.org/", object.val
  end

end
