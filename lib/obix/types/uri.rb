require "uri"

module OBIX
  module Types

    class URI < Type

      # Cast the given value to a URI.
      #
      # value - Any object that responds to `to_s`.
      #
      # Returns a string.
      def cast value
        parent = @element.parent

        if parent
          url = ::URI.join parent.href, value
        else
          url = ::URI.join "#{OBIX.configuration.scheme}://#{OBIX.configuration.host}", value
        end

        url.to_s
      end

    end

  end
end
