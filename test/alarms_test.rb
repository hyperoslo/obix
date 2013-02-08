require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class AlarmsTest < MiniTest::Unit::TestCase
  def test_initialize
    alarms = OBIX::Alarms.new file: "test/fixtures/alarmsubject.xml"

    assert_instance_of OBIX::Alarms, alarms
  end

  def test_count
    alarms = OBIX::Alarms.new file: "test/fixtures/alarmsubject.xml"

    assert_equal 3, alarms.count
  end

  def test_query
    alarms = OBIX::Alarms.new file: "test/fixtures/alarmsubject.xml"

    OBIX::Objects::Operation.any_instance.
      expects(
        :invoke
      ).
      returns(
        OBIX.parse file: "test/fixtures/alarmqueryout.xml"
      )

    alarms = alarms.query start: 1.year.ago, end: 0.seconds.ago

    assert_instance_of OBIX::Objects::List, alarms
  end
end
