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

  end

end
