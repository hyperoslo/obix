module OBIX
  module Objects

    # Floats represent floating point numbers.
    class Float < Object
      attribute :val, type: Types::Float
      attribute :min, type: Types::Float
      attribute :max, type: Types::Float
      attribute :unit, type: Types::String
      attribute :precision, type: Types::Integer
    end

  end
end
