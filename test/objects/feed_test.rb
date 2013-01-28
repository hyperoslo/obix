require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class FeedTest < MiniTest::Unit::TestCase

  def test_parses_feeds
    object = OBIX.parse string: fixture("objects/feed.xml")

    assert_instance_of OBIX::Objects::Feed, object
    assert_equal "obix:Alarm", object.of
  end

end
