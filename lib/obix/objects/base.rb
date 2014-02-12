module OBIX
  module Objects

    class Base
      extend Tag

      attr_accessor :objects, :parent, :attributes

      def initialize &block
        @attributes = {}
        @objects    = []

        if block_given?
          builder = OBIX::Builder.new self, &block

          @objects = builder.objects
        end
      end

      # Find the object by the given name.
      #
      # name - A String or Symbol describing the "name" attribute of an object.
      def find name
        object = objects.find { |o| o.name == name.to_s }
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

        # Parse an XML element as OBIX.
        #
        # element - A Nokogiri::XML::Node describing an element.
        # parent  - An Objects::Object instance or derivative thereof describing
        #           the object's parent.
        #
        # Returns an Object instance or derivative thereof.
        def parse element, parent = nil
          klass = Objects.find element.name

          object = klass.new

          element.attributes.each do |name, attribute|
            object.send "#{name.underscore}=", attribute.value unless attribute.namespace
          end

          element.children.each do |child|
            object.objects.push parse(child, object) unless child.is_a? Nokogiri::XML::Text
          end

          object.parent = parent

          if object.is_a? Error
            object.raise
          end

          object
        end

      end

      protected

      # Build the object as an element in a tree.
      #
      # xml - A Nokogiri::XML::Builder instance.
      def build builder
        builder.send tag, @attributes do |builder|
          objects.each do |object|
            object.build builder
          end
        end
      end

    end

  end
end
