module OBIX
  module Objects

    # Booleans represent a boolean condition of either true or false.
    class Boolean < Object
      tag :bool

      attribute :val, type: Types::Boolean, default: false
    end

  end
end
