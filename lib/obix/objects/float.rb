module OBIX
  module Objects

    # Floats represent floating point numbers.
    class Float < Object
      tag :real

      attribute :val, type: Types::Float, default: 0.0
      attribute :min, type: Types::Float
      attribute :max, type: Types::Float
      attribute :unit, type: Types::String
      attribute :precision, type: Types::Integer
    end

  end
end
