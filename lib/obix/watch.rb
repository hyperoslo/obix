module OBIX
  
  class Watch

    # Initialize a watch.
    #
    # watch - An OBIX object that implements the Watch contract.
    def initialize watch
      @watch = watch
    end

    # Reference the watch.
    #
    # Returns a String describing the URL to the watch.
    def url
      @watch.href
    end

    # Reference the lease of the watch.
    #
    # Returns an Integer describing the lease in seconds.
    def lease
      @watch.objects.find { |o| o.name == "lease" }.val
    end

    # Set the lease of the watch.
    #
    # seconds - A String describing a duration to extend the lease time of the watch to in XSD format.
    #           See http://www.w3schools.com/schema/schema_dtypes_date.asp.
    def lease=duration
      lease = @watch.objects.find { |o| o.name == "lease" }

      lease.attributes[:val] = duration

      Network.put lease.href, lease
    end

    # Add objects to the watch.
    #
    # list - An Array of String instances describing objects to add to the watch.
    def add list
      list_action list, "add"
    end

    # Remove objects from the watch.
    #
    # list - An Array of String instances describing objects to remove from the watch.
    def remove list
      list_action list, "remove"
    end

    # Poll objects that have changed
    def changes
      poll("Changes")
    end

    # Poll all objects
    def all
      poll("Refresh")
    end

    # Delete the watch.
    def delete
      @watch.objects.find do |object|
        object.name == "delete"
      end.invoke
    end

    def to_s
      @watch.to_s
    end

    class << self
      alias make new

      # Create a new watch.
      #
      # source - A Hash of options (see OBIX#parse for details).
      def make source
        service = OBIX.parse source

        make = service.objects.find do |object|
          object.name == "make"
        end

        new make.invoke
      end

      # Connect to an existing watch.
      #
      # source - A Hash of options (see OBIX#parse for details).
      def connect source
        new OBIX.parse source
      end
    end

    private

    # Add objects to or remove objects from the watch.
    #
    # list - An Array of String instances describing objects to add or remove
    def list_action list, action_type
      action = @watch.objects.find { |obj| obj.name == action_type }

      obix = OBIX::Builder.new do |obix|
        obix.obj is: "obix:WatchIn" do |obix|
          obix.list name: "hrefs" do |obix|
            list.each do |item|
              obix.uri val: item
            end
          end
        end
      end

      action.invoke obix.object
    end

    # Poll objects with specified name.
    #
    # name - a string representing the type of object to be polled in the watch
    def poll name
      poll = @watch.objects.find { |obj| obj.name == "poll#{name}" }

      poll.invoke.objects.find do |object|
        object.name == "values"
      end.objects
    end

  end

end
