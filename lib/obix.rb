require "obix/version"
require "nokogiri"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Types, "obix/types"
  autoload :Tag, "obix/tag"
  autoload :Builder, "obix/builder"

  # Parse the given source as OBIX.
  #
  # source - A Hash of options:
  #          :string - A String describing oBIX data.
  #          :url    - A String describing a URL that the oBIX data may be loaded from.
  #
  # Returns an OBIX::Object instance.
  def self.parse source
    raise StandardError, "You may only provide a single source" if source.size > 1

    string = source[:string]
    url    = source[:url]
    file   = source[:file]

    if url
      string = Net::HTTP.get URI url
    end

    if file
      string = File.read file
    end

    document = Nokogiri::XML.parse(string) do |config|
      config.noblanks
    end

    parse_element document.root
  end

  # Parse the given element as an OBIX object.
  #
  # element - A Nokogiri::XML::Node instance.
  #
  # Returns an OBIX::Object instance or derivative thereof.
  def self.parse_element element
    object = OBIX::Objects.list.find do |object|
      object.new.tag.to_s == element.name
    end

    if object
      object.parse element
    else
      raise "Unknown element #{element}"
    end
  end
end
