module OBIX
  module Objects

    # Booleans represent a boolean condition of either true or false.
    class Boolean < Object
      tag :bool

      attribute :val, type: Types::Boolean, default: false
      attribute :range, type: Types::URI
    end

  end
end
