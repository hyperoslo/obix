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

        if parent and parent.href.present?
          url = ::URI.join parent.href, value
        else
          url = ::URI.join value
        end

        url.to_s
      rescue ::URI::InvalidURIError
        value = ::URI.encode value
        retry
      end

    end

  end
end
