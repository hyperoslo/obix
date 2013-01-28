module OBIX
  
  class History

    # Initialize a history.
    #
    # source - A Hash of options (see OBIX#parse for details).
    def initialize source
      @history = OBIX.parse source
    end

    # The number of history records contained by the history.
    # 
    # Returns an Integer.
    def count
      @history.objects.find { |o| o.name == "count" }.val
    end

    # The timestamp of the oldest record contained by the history.
    #
    # Returns a DateTime instance.
    def start
      @history.objects.find { |o| o.name == "start" }.val
    end

    # The timestamp of the newest record contained by the history.
    def end
      @history.objects.find { |o| o.name == "end" }.val
    end

    # The timezone of the history data.
    def timezone
      @history.objects.find { |o| o.name == "tz" }.val
    end

    # Query the history records contained by the history.
    #
    # options - A Hash of options:
    #           :start - A DateTime instance describing the earliest time to query history for.
    #           :end   - A DateTime instance describing the latest time to query history for.
    def query options
      from = options.fetch :start
      to   = options.fetch :end

      query = @history.objects.find { |o| o.name == "query" }

      filter = OBIX::Builder.new do
        obj do
          abstime name: "start", val: from.iso8601
          abstime name: "end", val: to.iso8601
        end
      end.object

      history = query.invoke filter

      history.objects.find { |o| o.name == "data" }
    end

    def to_s
      @history.to_s
    end

  end

end
