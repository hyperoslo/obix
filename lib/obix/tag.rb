require "active_support/all"

module OBIX
  module Tag

    # Define a method for accessing the name of the tag.
    #
    # name - A Symbol or String describing the name of the tag.
    def tag name
      define_method :tag do
        name
      end
    end

    # Define a method for accessing the given attribute.
    #
    # name    - A Symbol describing the name of the attribute.
    # options - A Hash of query options:
    #           :type - A class describing the type of this attribute (defaults to nil).
    def attribute name, options = {}
      klass   = options.fetch :type, nil
      default = options.fetch :default, nil

      name = name.to_s.underscore

      define_method name do
        value = @attributes[name] || default

        if klass
          type = klass.new self
          type.cast value
        else
          value
        end
      end

      define_method "#{name}=" do |value|
        @attributes.store name, value
      end
    end

  end
end
