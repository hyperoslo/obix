require "date"

module OBIX
  module Types

    class Date < Type

      # Cast the given value to a date.
      #
      # value - A string that may be parsed by `Date.parse`.
      #
      # Returns a string.
      def self.cast value
        ::Date.parse value
      end

    end

  end
end
