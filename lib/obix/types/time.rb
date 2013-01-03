require "time"

module OBIX
  module Types

    class Time

      # Cast the given value to a time.
      #
      # value - A string that may be parsed by `Time.parse`.
      #
      # Returns a string.
      def self.cast value
        ::Time.parse value
      end

    end

  end
end
