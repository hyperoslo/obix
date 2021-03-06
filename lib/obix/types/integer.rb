module OBIX
  module Types

    class Integer < Type

      # Cast the given value to an integer.
      #
      # value - Any object that responds to `to_i`.
      #
      # Returns an integer.
      def cast value
        value.to_i
      end

    end

  end
end
