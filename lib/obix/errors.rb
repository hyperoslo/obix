module OBIX
  class Error < StandardError; end
  class BadURIError < Error; end
  class UnsupportedError < Error; end
  class PermissionError < Error; end
end
