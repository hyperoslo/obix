module OBIX
  module Objects

    # Objects are the root abstraction in oBIX.
    class Object < Base
      tag :obj

      attribute :name, type: Types::String
      attribute :href, type: Types::URI, default: ""
      attribute :is, type: Types::String
      attribute :null, type: Types::Boolean
      attribute :icon, type: Types::String
      attribute :display_name, type: Types::String
      attribute :display, type: Types::String
      attribute :writable, type: Types::Boolean
      attribute :status, type: Types::String
    end

  end
end
