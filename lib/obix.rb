require "obix/version"
require "nokogiri"
require "net/http"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Types, "obix/types"
  autoload :Watch, "obix/watch"
  autoload :Tag, "obix/tag"
  autoload :Builder, "obix/builder"
  autoload :Configuration, "obix/configuration"
  autoload :Network, "obix/network"

  # Parse the given source as OBIX.
  #
  # source  - A Hash describing the source.
  #           :string - A String describing oBIX data.
  #           :file   - A String describing a file that contains oBIX data.
  #           :url    - A String describing a URL that the oBIX data may be loaded from.
  #
  # Returns an OBIX::Object instance.
  def self.parse source
    string = source[:string]
    url    = source[:url]
    file   = source[:file]

    if url
      string = Network.get url
    end

    if file
      string = File.read file
    end

    document = Nokogiri::XML.parse string do |config|
      config.noblanks
      config.strict
    end

    OBIX::Objects::Object.parse document.root
  end

  def self.configuration
    Configuration
  end

  def self.configure &block
    Configuration.configure &block
  end
end
