require "net/http"

module OBIX
  module Network
    include Net

    extend self

    # Make a get request.
    #
    # url    - A String describing where the request should be sent.
    # object - A Objects::Object or derivative thereof describing the OBIX element to send.
    def get url
      url     = URI url
      request = HTTP::Get.new url.path

      dispatch request, to: url
    end

    # Make a post request.
    #
    # url    - A String describing where the request should be sent.
    # object - A Objects::Object or derivative thereof describing the OBIX element to send.
    def post url, object = nil
      url     = URI url
      request = HTTP::Post.new url.path

      if object
        request.body = object.to_xml
      end

      dispatch request, to: url
    end

    private

    # Dispatch the given request.
    #
    # request - A derivative of Net::HTTPGenericRequest describing the request.
    # options - A Hash with query options:
    #           :to - An URI instance describing where the request should be sent.
    #
    # Returns a Net::HTTPResponse instance.
    def dispatch request, options
      url = options.fetch :to

      if url.relative?
        url = URI.join "#{OBIX.configuration.scheme}://#{OBIX.configuration.host}", url
      end

      options = {
        use_ssl: true,
        verify_mode: OpenSSL::SSL::VERIFY_NONE,
        open_timeout: 10,
        read_timeout: OBIX.configuration.timeout
      }

      response = HTTP.start url.host, url.port, options do |http|
        request.basic_auth OBIX.configuration.username, OBIX.configuration.password
        http.request request
      end

      unless response.code == "200"
        raise Error, "The server responded with an unexpected status code #{response.code} for #{url}."
      end

      response.body

    rescue ::Timeout::Error
      raise Timeout, "The remote server did not respond in a timely fashion"
    end

    class Error < StandardError; end
    class Timeout < Error; end
  end
end
