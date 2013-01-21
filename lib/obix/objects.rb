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
    autoload :URI, "obix/objects/uri"
    autoload :Reference, "obix/objects/reference"
    autoload :Error, "obix/objects/error"

    @objects = [
      Object, Float, Integer, Boolean, String, Enumerable, Time,
      Date, List, Operation, Duration, URI, Reference, Error
    ]

    # List objects.
    #
    # Returns an array of OBIX::Objects::Object instances or derivatives thereof.
    def self.list
      @objects
    end

    # Find an object by the given tag.
    #
    # tag - A String or Symbol describing a tag.
    #
    # Returns a derivative of OBIX::Objects::Base.
    def self.find tag
      object = @objects.find do |object|
        object.new.tag.to_s == tag.to_s
      end or raise OBIX::Objects::UnknownObjectError, "Unknown element '#{tag}'"
    end

    class UnknownObjectError < StandardError; end
  end
end

