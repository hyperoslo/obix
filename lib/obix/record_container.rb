module OBIX

  class RecordContainer
    
    # Initialize a RecordContainer based on OBIX source
    #
    # source - A Hash of options (see OBIX#parse for details).
    def initialize source
      @records = OBIX.parse source
    end
    
    # The number of records.
    # 
    # Returns an Integer.
    def count
      @records.objects.find { |o| o.name == "count" }.val
    end
    
    # Query the records
    #
    # options - A Hash of options:
    #           :start - A DateTime instance describing the earliest time to query for.
    #           :end   - A DateTime instance describing the latest time to query for.
    def query options
      from = options.fetch :start
      to   = options.fetch :end

      query = @records.objects.find { |o| o.name == "query" }

      filter = OBIX::Builder.new do
        obj do
          abstime name: "start", val: from.iso8601
          abstime name: "end", val: to.iso8601
        end
      end.object

      filter_result = query.invoke filter
      filter_result.objects.find { |o| o.name == "data" }
    end

    def to_s
      @records.to_s
    end
  end
end
