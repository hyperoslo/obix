require "net/http"

module OBIX
  module Objects

    # Operations represent operations.
    class Operation < Object
      tag :op

      attribute :href, type: Types::String
      attribute :in, type: Types::String
      attribute :out, type: Types::String

      # Invoke the operation.
      #
      # object - An OBIX::Objects::Object or derivative thereof.
      #
      # Returns an OBIX::Objects::Object or derivative thereof describing
      # the result of the operation.
      def invoke object = nil
        url = URI href

        response = Net::HTTP.start url.host, url.port do |http|
          request = Net::HTTP::Post.new url.path

          if object
            request.body = object.to_xml
          end

          request.basic_auth OBIX.configuration.username, OBIX.configuration.password

          http.request request
        end

        OBIX.parse string: response.body
      end
    end

  end
end
