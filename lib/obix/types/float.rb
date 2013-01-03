module OBIX
  module Types

    class Float

      # Cast the given value to a float.
      #
      # value - Any object that responds to `to_f`.
      #
      # Returns a float.
      def self.cast value
        value.to_f
      end

    end

  end
end
