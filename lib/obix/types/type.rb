module OBIX
  module Types

    class Type

      # Initialize the Type.
      #
      # element - An Objects::Object instance or derivative thereof describing
      #           the element that this type belongs to.
      def initialize element
        @element = element
      end

    end

  end
end
