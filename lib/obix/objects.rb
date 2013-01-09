module OBIX
  module Objects
    autoload :Base, "obix/objects/base"
    autoload :Object, "obix/objects/object"
    autoload :Float, "obix/objects/float"
    autoload :Integer, "obix/objects/integer"
    autoload :Boolean, "obix/objects/boolean"
    autoload :String, "obix/objects/string"
    autoload :Enumerable, "obix/objects/enumerable"
    autoload :Time, "obix/objects/time"
    autoload :Date, "obix/objects/date"
    autoload :List, "obix/objects/list"
    autoload :Operation, "obix/objects/operation"
    autoload :Duration, "obix/objects/duration"

    @objects = [
      Object, Float, Integer, Boolean, String, Enumerable,
      Time, Date, List, Operation, Duration
    ]

    # List objects.
    #
    # Returns an array of OBIX::Objects::Object instances or derivatives thereof.
    def self.list
      @objects
    end

    class UnknownObjectError < StandardError; end
  end
end

