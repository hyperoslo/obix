module OBIX

  class Object
    attr_reader :objects

    def initialize attributes
      attributes.each do |key, value|
        instance_variable_set "@#{key}", value
        self.class.send :attr_reader, key
      end
    end

    # Initialize an object with the given string.
    #
    # object - A Nokogiri::XML::Node describing an object.
    #
    # Returns an Object instance.
    def self.parse object
      attributes = {}

      object.attributes.each do |name, attribute|
        attributes.store name, attribute.value
      end

      object.children.each do |child|
        attributes.store child["name"].underscore, parse(child)
      end

      new attributes
    end

  end

end
