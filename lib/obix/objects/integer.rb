module OBIX
  module Objects

    # Integers represent an integer number.
    class Integer < Object
      tag :int

      attribute :val, type: Types::Integer, default: 0
      attribute :min, type: Types::Integer
      attribute :max, type: Types::Integer
      attribute :unit, type: Types::String
    end

  end
end
