require "obix"
require "minitest/unit"
require "minitest/autorun"
require "active_support/all"

require "test_helper"

class NetworkTest < MiniTest::Unit::TestCase
  include Net

  def test_get
    HTTP.
      expects(
        :start
      ).
      with(
        "example.org", 80, {
          use_ssl: true,
          verify_mode: OpenSSL::SSL::VERIFY_NONE,
          open_timeout: 30,
          read_timeout: OBIX.configuration.timeout
        }
      ).
      returns(
        stub code: "200", body: "<body>"
      )

    body = OBIX::Network.get "http://example.org/"

    assert_equal "<body>", body
  end

  def test_post
    HTTP.
      expects(
        :start
      ).
      with(
        "example.org", 80, {
          use_ssl: true,
          verify_mode: OpenSSL::SSL::VERIFY_NONE,
          open_timeout: 30,
          read_timeout: OBIX.configuration.timeout
        }
      ).
      returns(
        stub code: "200", body: "<body>"
      )

    body = OBIX::Network.post "http://example.org/"

    assert_equal "<body>", body
  end

  def test_post_with_object
    HTTP.
      expects(
        :start
      ).
      with(
        "example.org", 80, {
          use_ssl: true,
          verify_mode: OpenSSL::SSL::VERIFY_NONE,
          open_timeout: 30,
          read_timeout: OBIX.configuration.timeout
        }
      ).
      returns(
        stub code: "200", body: "<body>"
      )

    object = mock

    object.
      expects(
        :to_xml
      ).
      returns(
        fixture "objects/string.xml"
      )

    body = OBIX::Network.post "http://example.org/", object

    assert_equal "<body>", body
  end

  def test_bad_response
    HTTP.
      expects(
        :start
      ).
      returns(
        stub code: "500", body: nil
      )

    assert_raises OBIX::Network::Error do
      OBIX::Network.get "http://example.org/"
    end
  end

  def test_expands_relative_urls
    HTTP.
      expects(
        :start
      ).
      with(
        "example.org", 80, {
          use_ssl: true,
          verify_mode: OpenSSL::SSL::VERIFY_NONE,
          open_timeout: 30,
          read_timeout: OBIX.configuration.timeout
        }
      ).
      returns(
        stub code: "200", body: "<body>"
      )

    body = OBIX::Network.get "/relative/url"
  end

  def test_times_out
    HTTP.
      expects(
        :start
      ).
      raises(
        ::Timeout::Error
      )

    assert_raises OBIX::Network::Timeout do
      OBIX::Network.get "http://example.org/"
    end
  end
end
