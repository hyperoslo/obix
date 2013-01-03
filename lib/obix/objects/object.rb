module OBIX
  module Objects

    # Objects are the root abstraction in oBIX.
    class Object
      extend Accessible

      attribute :name, type: Types::String
      attribute :href, type: Types::String
      attribute :is, type: Types::String
      attribute :null, type: Types::Boolean
      attribute :icon, type: Types::String
      attribute :display_name, type: Types::String
      attribute :display, type: Types::String
      attribute :writable, type: Types::Boolean
      attribute :status, type: Types::String

      def initialize attributes, objects
        @attributes = attributes.merge objects

        objects.each do |key, value|
          self.class.send :attribute, key
        end
      end

      class << self

        # Initialize an object with the given string.
        #
        # object - A Nokogiri::XML::Node describing an object.
        #
        # Returns an Object instance.
        def parse object
          attributes = {}
          objects    = {}

          object.attributes.each do |name, attribute|
            attributes.store name, attribute.value
          end

          object.children.each do |child|
            name   = child["name"].underscore

            # TODO: Refactor this.
            object = case child.name
            when "real"
              Float.parse child
            when "bool"
              Boolean.parse child
            else
              raise StandardError, "Could not parse #{child}"
            end

            objects.store name, object
          end

          new attributes, objects
        end

      end

    end

  end
end
