module OBIX
  module Types

    class Boolean < Type

      # Cast the given value to a boolean.
      #
      # value - A string that is either "true" or "false".
      #
      # Returns a boolean.
      def self.cast value
        case value
        when "true"
          true
        when "false"
          false
        else
          raise StandardError, "Could not cast #{value} to a boolean"
        end
      end

    end

  end
end
