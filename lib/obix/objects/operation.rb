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
      # object - An OBIX::Objects::Object or derivative thereof. Defaults to an object
      #          that implements the "obix:Nil" contract.
      #
      # Returns an OBIX::Objects::Object or derivative thereof describing
      # the result of the operation.
      def invoke object = OBIX::Objects::Object.new
        string = Network.post href, object

        OBIX.parse string: string
      end
    end

  end
end
