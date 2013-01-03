require "obix/version"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Float, "obix/float"

  autoload :Types, "obix/types"

  autoload :Accessible, "obix/accessible"

  # Parse the given string as oBIX.
  #
  # string - A String describing oBIX data.
  #
  # Returns an OBIX::Object instance.
  def self.parse string
    document = Nokogiri::XML.parse(string) do |config|
      config.noblanks
    end

    OBIX::Objects::Object.parse document.root
  end
end
