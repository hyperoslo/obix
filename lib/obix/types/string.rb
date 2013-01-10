module OBIX
  module Types

    class String < Type

      # Cast the given value to a string.
      #
      # value - Any object that responds to `to_s`.
      #
      # Returns a string.
      def cast value
        value.to_s
      end

    end

  end
end
