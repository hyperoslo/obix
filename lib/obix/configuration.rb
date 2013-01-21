module OBIX

  module Configuration

    def self.configure &block
      instance_eval &block
    end

    def self.definitions
      @definitions ||= {}
    end

    # The username to use when communicating with the server.
    #
    # username - A String describing the username.
    def self.username= username
      definitions[:username] = username
    end

    # The username to use when communicating with the server.
    def self.username
      definitions[:username]
    end

    # The password to use when communicating with the server.
    #
    # password - A String describing the password.
    def self.password= password
      definitions[:password] = password
    end

    # The password to use when communicating with the server.
    def self.password
      definitions[:password]
    end

    # The scheme of the server.
    #
    # host - A String describing the host.
    def self.scheme= scheme
      definitions[:scheme] = scheme
    end

    # The scheme of the server.
    def self.scheme
      definitions[:scheme] || "http"
    end

    # The host of the server.
    #
    # host - A String describing the host.
    def self.host= host
      definitions[:host] = host
    end

    # The host of the server.
    def self.host
      definitions[:host]
    end

  end

end
