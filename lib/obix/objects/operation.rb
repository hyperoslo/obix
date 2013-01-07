require "net/http"

module OBIX
  module Objects

    # Operations represent operations.
    class Operation < Object
      attribute :href, type: Types::String
      attribute :in, type: Types::String
      attribute :out, type: Types::String

      # Invoke the operation.
      #
      # object - An OBIX::Objects::Object or derivative thereof.
      def invoke object = nil
        uri = URI "http://example.org/#{href}"

        Net::HTTP.start uri.host do |http|
          if object
            http.post href, object.to_xml
          else
            http.post href, nil
          end
        end
      end
    end

  end
end

