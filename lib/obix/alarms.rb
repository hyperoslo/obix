require "obix/queryable"

module OBIX

  class Alarms
    include Queryable

    # Initialize Alarms based on OBIX source
    # The source will be parsed lazily
    #
    # source - A Hash of options (see OBIX#parse for details).
    def initialize(source)
      @source = source
    end
  end

end
