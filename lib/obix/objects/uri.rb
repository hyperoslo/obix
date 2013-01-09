module OBIX
  module Objects

    # URIs represent a URI reference.
    class URI < Object
      tag :uri

      attribute :val, type: Types::String
    end

  end
end

