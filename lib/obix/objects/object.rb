module OBIX
  module Objects

    # Objects are the root abstraction in oBIX.
    class Object
      extend Tag

      tag :obj

      attribute :name, type: Types::String
      attribute :href, type: Types::String
      attribute :is, type: Types::String
      attribute :null, type: Types::Boolean
      attribute :icon, type: Types::String
      attribute :display_name, type: Types::String
      attribute :display, type: Types::String
      attribute :writable, type: Types::Boolean
      attribute :status, type: Types::String

      attr_reader :objects, :attributes

      def initialize attributes, objects = []
        @attributes = attributes
        @objects    = objects
      end

      def to_xml
        xml = Nokogiri::XML::Builder.new do |xml|
          xml.send tag, attributes do
            objects.each do |object|
              xml.send object.tag, object.attributes
            end
          end
        end

        xml.doc.root.to_xml
      end

      def to_s
        attributes = @attributes.map do |key, value|
          "#{key}: \"#{value}\""
        end.join " "

        "#<#{self.class} #{attributes}>"
      end

      class << self

        # Initialize an object with the given string.
        #
        # object - A Nokogiri::XML::Node describing an object.
        #
        # Returns an Object instance.
        def parse object
          attributes = {}
          objects    = []

          object.attributes.each do |name, attribute|
            attributes.store name, attribute.value
          end

          object.children.each do |child|
            next if child.is_a? Nokogiri::XML::Text

            object = OBIX.parse_element child

            objects << object
          end

          new attributes, objects
        end

      end

    end

  end
end
