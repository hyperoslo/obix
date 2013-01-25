module OBIX

  class Builder
    attr_reader :objects

    # Initialize a new builder.
    #
    # parent - An Objects::Object instance or derivative thereof describing the parent
    #          of the object that will be built.
    def initialize parent = nil, &block
      @parent  = parent
      @objects = []

      instance_eval &block
    end

    def object
      objects.first
    end

    # Respond to methods matching OBIX tags.
    def method_missing method, attributes, &block
      klass = Objects.find method

      object = klass.new &block

      attributes.each do |key, value|
        object.send "#{key}=", value
      end

      object.parent = @parent

      if @parent
        @objects.push object
      else
        if @objects.empty?
          @objects.push object
        else
          raise ArgumentError, "Object already has a root"
        end
      end
    end
  end

end
