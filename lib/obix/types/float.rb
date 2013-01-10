module OBIX
  module Types

    class Float < Type

      # Cast the given value to a float.
      #
      # value - Any object that responds to `to_f`.
      #
      # Returns a float.
      def cast value
        value.to_f
      end

    end

  end
end
