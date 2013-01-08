module OBIX
  module Objects

    # Lists represent a collection of other objects.
    class List < Object
      tag :list

      attribute :of, type: Types::String
      attribute :min, type: Types::Integer
      attribute :max, type: Types::Integer
    end

  end
end
