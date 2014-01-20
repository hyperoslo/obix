require "obix/queryable"

module OBIX

  class History
    include Queryable

    # Initialize Queryable based on OBIX source
    # The source will be parsed lazily
    #
    # source - A Hash of options (see OBIX#parse for details).
    def initialize(source)
      @source = source
    end

    # The timestamp of the oldest record contained by the history.
    #
    # Returns a DateTime instance.
    def start
      self.records.objects.find { |o| o.name == "start" }.val
    end

    # The timestamp of the newest record contained by the history.
    def end
      self.records.objects.find { |o| o.name == "end" }.val
    end

    # The timezone of the history data.
    def timezone
      self.records.objects.find { |o| o.name == "tz" }.val
    end

  end

end
