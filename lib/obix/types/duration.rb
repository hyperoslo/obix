require "rdf/xsd"

module OBIX
  module Types

    class Duration < Type

      # Cast the given value to an integer describing seconds.
      #
      # value - A String describing an XSD (http://www.w3schools.com/schema/schema_dtypes_date.asp).
      #
      # Returns an Integer.
      def cast value
        duration = RDF::Literal::Duration.new value
        duration.to_i
      end

    end

  end
end
