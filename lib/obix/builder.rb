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
    def method_missing method, *args, &block
      object = OBIX::Objects.find method

      @objects.push object.new *args, &block
    end
  end

end
