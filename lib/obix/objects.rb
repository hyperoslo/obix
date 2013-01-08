module OBIX
  module Objects
    autoload :Base, "obix/objects/base"

    @objects = []

    # List objects.
    #
    # Returns an array of OBIX::Objects::Object instances or derivatives thereof.
    def self.list
      @objects
    end

    # Register an object.
    #
    # object - A class that inherits from OBIX::Objects::Base.
    def self.register object
      @objects.push object
    end

    # Load all objects.
    def self.load
      require "obix/objects/object"
      require "obix/objects/float"
      require "obix/objects/integer"
      require "obix/objects/boolean"
      require "obix/objects/string"
      require "obix/objects/enumerable"
      require "obix/objects/time"
      require "obix/objects/date"
      require "obix/objects/list"
      require "obix/objects/operation"
      require "obix/objects/duration"
    end

    load
  end
end

