module OBIX
  module Objects

    # Errors represent errors.
    class Error < Object
      tag :err

      # Raise an exception with this error.
      def raise
        klass = case is
        when "obix:BadUriErr"
          OBIX::BadURIError
        when "obix:UnsupportedErr"
          OBIX::UnsupportedError
        when "obix:PermissionErr"
          OBIX::PermissionError
        else
          OBIX::Error
        end

        super klass, display
      end
    end

  end
end
