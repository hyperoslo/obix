require "date"

module OBIX
  module Types

    class Time < Type

      # Cast the given value to a time.
      #
      # value - A string that may be parsed by `Time.parse`.
      #
      # Returns a string.
      def cast value
        ::DateTime.parse value
      end

    end

  end
end
