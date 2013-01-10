require "rdf/xsd"

module OBIX
  module Types

    class Duration < Type

      # Cast the given value to an integer describing seconds.
      #
      # value - A String describing an XSD
      #
      # Returns an Integer.
      def self.cast value
        duration = RDF::Literal::Duration.new value
        duration.to_i
      end

    end

  end
end
