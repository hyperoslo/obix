module OBIX

  class Builder
    attr_reader :objects

    def initialize
      @objects = []

      yield self
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

      @objects.push object
    end
  end

end
