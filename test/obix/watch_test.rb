require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class WatchTest < MiniTest::Unit::TestCase
  def test_connect
    watch = OBIX::Watch.connect file: "test/fixtures/watch.xml"

    assert_instance_of OBIX::Watch, watch
  end
  
  def test_make
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    assert_instance_of OBIX::Watch, watch
  end

  def test_url
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    assert_equal "http://domain/watchservice/watch32/", watch.url
  end

  def test_get_lease
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    assert_equal 10, watch.lease
  end

  def test_set_lease
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    builder = OBIX::Builder.new do
      reltime name: "lease", val: "PT30S", href: "http://domain/watchservice/watch32/lease/", display: "30sec", display_name: "Lease", writable: true
    end

    OBIX::Network.
      expects(
        :put
      ).
      with do |url, object|
        url == "http://domain/watchservice/watch32/lease/" && object.is_a?(OBIX::Objects::Duration)
      end

    watch.lease = "PT30S"
  end

  def test_add
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watchout.xml"
      )

    result = watch.add ["/thermostat/"]
  end

  def test_remove
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watchout.xml"
      )

    watch.remove ["/thermostat/"]
  end

  def test_changes
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watchout.xml"
      )

    changes = watch.changes

    assert_equal "http://example.org/thermostat/", changes.first.href
    assert_equal 39.28, changes.first.val
  end

  def test_all
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watchout.xml"
      )

    changes = watch.all

    assert_equal "http://example.org/thermostat/", changes.first.href
    assert_equal 39.28, changes.first.val
  end

  def test_delete
    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/watch.xml"
      )

    watch = OBIX::Watch.make file: "test/fixtures/watchservice.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      )

    changes = watch.delete
  end
end
