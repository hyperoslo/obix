module OBIX
  module Objects

    class Base
      extend Tag

      attr_reader :objects, :attributes

      def initialize attributes = {}, objects = [], &block
        @attributes = {}

        attributes.each do |key, value|
          send "#{key.to_s.underscore}=", value
        end

        if block_given?
          builder = OBIX::Builder.new &block

          @objects = builder.objects
        else
          @objects = objects
        end
      end

      # Serialize the object as a Nokogiri::XML::Node.
      def to_node
        Nokogiri::XML::Builder.new do |xml|
          build xml
        end.doc.root
      end

      # Serialize the object as an XML String.
      def to_xml
        to_node.document.to_xml
      end

      # Serialize the object as a human-readable String.
      def to_s
        attributes = @attributes.map do |key, value|
          "#{key}: \"#{value}\""
        end.join " "

        "#<#{self.class} #{attributes}>"
      end

      class << self

        # Initialize an object with the given string.
        #
        # object - A Nokogiri::XML::Node describing an element.
        #
        # Returns an Object instance.
        def parse element
          object = OBIX::Objects.find element.name

          attributes = {}
          objects    = []

          element.attributes.each do |name, attribute|
            attributes.store name.to_sym, attribute.value
          end

          element.children.each do |child|
            objects.push parse child unless child.is_a? Nokogiri::XML::Text
          end

          object.new attributes, objects
        end

      end

      protected

      # Build the object as an element in a tree.
      #
      # xml - A Nokogiri::XML::Builder instance.
      def build builder
        builder.send tag, attributes do |builder|
          objects.each do |object|
            object.build builder
          end
        end
      end

    end

  end
end
