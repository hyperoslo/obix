module OBIX
  module Objects

    # Lists represent a collection of other objects.
    class Feed < Object
      tag :feed

      attribute :in, type: Types::String
      attribute :of, type: Types::String
    end

  end
end

