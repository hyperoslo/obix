require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class HistoryTest < MiniTest::Unit::TestCase
  def test_initialize
    history = OBIX::History.new file: "test/fixtures/history.xml"

    assert_instance_of OBIX::History, history
  end

  def test_count
    history = OBIX::History.new file: "test/fixtures/history.xml"

    assert_equal 100, history.count
  end

  def test_start
    history = OBIX::History.new file: "test/fixtures/history.xml"

    assert_equal DateTime.parse("2012-01-01 00:00:00"), history.start
  end

  def test_end
    history = OBIX::History.new file: "test/fixtures/history.xml"

    assert_equal DateTime.parse("2013-01-01 00:00:00"), history.end
  end

  def test_timezone
    history = OBIX::History.new file: "test/fixtures/history.xml"

    assert_equal "America/New_York", history.timezone
  end

  def test_query
    history = OBIX::History.new file: "test/fixtures/history.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/historyqueryout.xml"
      )

    records = history.query start: 1.year.ago, end: 0.seconds.ago

    assert_instance_of OBIX::Objects::List, records
  end
end
