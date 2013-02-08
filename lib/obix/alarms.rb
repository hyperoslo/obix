module OBIX

  class Alarms

    # Initialize an alarm service.
    #
    # source - A Hash of options (see OBIX#parse for details).
    def initialize source
      @alarms = OBIX.parse source
    end

    # The number of alarms.
    # 
    # Returns an Integer.
    def count
      @alarms.objects.find { |o| o.name == "count" }.val
    end

    # Query alarms.
    #
    # options - A Hash of options:
    #           :start - A DateTime instance describing the earliest time to query history for.
    #           :end   - A DateTime instance describing the latest time to query history for.
    def query options
      from = options.fetch :start
      to   = options.fetch :end

      query = @alarms.objects.find { |o| o.name == "query" }

      filter = OBIX::Builder.new do
        obj do
          abstime name: "start", val: from.iso8601
          abstime name: "end", val: to.iso8601
        end
      end.object

      alarms = query.invoke filter

      alarms.objects.find { |o| o.name == "data" }
    end

    def to_s
      @alarms.to_s
    end

  end

end
