module OBIX
  module Types

    class String

      # Cast the given value to a string.
      #
      # value - Any object that responds to `to_s`.
      #
      # Returns a string.
      def self.cast value
        value.to_s
      end

    end

  end
end
