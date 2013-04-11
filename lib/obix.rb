require "obix/version"
require "nokogiri"
require "net/http"
require "obix/errors"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Types, "obix/types"
  autoload :Watch, "obix/watch"
  autoload :Alarms, "obix/alarms"
  autoload :History, "obix/history"
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

    object = OBIX::Objects::Object.parse document.root

    # According to chapter 5.2 of the OBIX specification, objects that don't have a "href"
    # attribute should have it derived from the server's authority URI.
    #
    # > As a general rule every object accessible for a read MUST specify a URI. An oBIX
    # > document returned from a read request MUST specify a root URI. However, there are
    # > certain cases where the object is transient, such as a computed object from an
    # > operation invocation. In these cases there MAY not be a root URI, meaning there
    # > is no way to retrieve this particular object again. If no root URI is provided, then
    # > the server's authority URI is implied to be the base URI for resolving relative URI references.
    if url and object.href.blank?
      object.href = url
    end

    object
  end

  def self.configuration
    Configuration
  end

  def self.configure &block
    Configuration.configure &block
  end
end
