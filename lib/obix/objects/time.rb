module OBIX
  module Objects

    # Times represent an absolute point in time.
    class Time < Object
      attribute :val, type: Types::Time, default: nil
      attribute :min, type: Types::Time
      attribute :max, type: Types::Time
      attribute :tz, type: Types::String
    end

  end
end
