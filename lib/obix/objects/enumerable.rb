module OBIX
  module Objects

    # Enumerables represent a value which must match a finite set of values.
    class Enumerable < Object
      attribute :val, type: Types::String, default: nil
      attribute :range, type: Types::String
    end

  end
end
