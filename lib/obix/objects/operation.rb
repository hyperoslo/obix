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
        uri = URI "http://example.org/#{href}"

        response = Net::HTTP.start uri.host do |http|
          if object
            http.post href, object.to_xml
          else
            http.post href, nil
          end
        end

        OBIX.parse string: response.body
      end
    end

  end
end
