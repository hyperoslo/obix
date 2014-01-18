module OBIX

  class History < RecordContainer

    # The timestamp of the oldest record contained by the history.
    #
    # Returns a DateTime instance.
    def start
      @records.objects.find { |o| o.name == "start" }.val
    end

    # The timestamp of the newest record contained by the history.
    def end
      @records.objects.find { |o| o.name == "end" }.val
    end

    # The timezone of the history data.
    def timezone
      @records.objects.find { |o| o.name == "tz" }.val
    end

  end

end
