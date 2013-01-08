module OBIX
  module Objects

    # Dates represent a day in time.
    class Date < Object
      tag :date

      attribute :val, type: Types::Date, default: nil
      attribute :min, type: Types::Date
      attribute :max, type: Types::Date
      attribute :tz, type: Types::String
    end

  end
end
