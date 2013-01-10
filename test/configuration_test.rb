require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class ConfigurationTest < MiniTest::Unit::TestCase
  def test_configures
    OBIX::Configuration.configure do |config|
      config.username = "foo"
      config.password = "bar"
    end

    assert_equal "foo", OBIX::Configuration.username
    assert_equal "bar", OBIX::Configuration.password
  end
end
