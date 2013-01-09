require "obix/version"
require "nokogiri"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Types, "obix/types"
  autoload :Watch, "obix/watch"
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

    OBIX::Objects::Object.parse document.root
  end
end
