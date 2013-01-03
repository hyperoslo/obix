require "obix/version"

module OBIX
  autoload :Object, "obix/object"

  # Parse the given string as oBIX.
  #
  # string - A String describing oBIX data.
  #
  # Returns an OBIX::Object instance.
  def self.parse string
    document = Nokogiri::XML.parse(string) do |config|
      config.noblanks
    end

    OBIX::Object.parse document.root
  end
end
