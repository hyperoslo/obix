module OBIX
  module Objects

    # Durations represent a relative duration of time.
    class Duration < Object
      attribute :val, type: Types::Duration, default: 0
      attribute :min, type: Types::Duration
      attribute :max, type: Types::Duration
    end

  end
end
