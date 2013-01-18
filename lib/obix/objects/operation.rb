require "net/http"

module OBIX
  module Objects

    # Operations represent operations.
    class Operation < Object
      tag :op

      attribute :in, type: Types::String
      attribute :out, type: Types::String

      # Invoke the operation.
      #
      # object - An OBIX::Objects::Object or derivative thereof.
      #
      # Returns an OBIX::Objects::Object or derivative thereof describing
      # the result of the operation.
      def invoke object = nil
        if object
          string = Network.post href, object
        else
          string = Network.post href
        end

        OBIX.parse string: string
      end
    end

  end
end
