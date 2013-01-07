require "obix/version"
require "nokogiri"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Types, "obix/types"
  autoload :Accessible, "obix/accessible"

  # Parse the given string as oBIX.
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

  # Parse the given element as an oBIX object.
  #
  # element - A Nokogiri::XML::Node instance.
  #
  # Returns an OBIX::Object instance or derivative thereof.
  def self.parse_element element
    case element.name
    when "obj"
      Objects::Object.parse element
    when "bool"
      Objects::Boolean.parse element
    when "int"
      Objects::Integer.parse element
    when "real"
      Objects::Float.parse element
    when "int"
      Objects::Integer.parse element
    when "str"
      Objects::String.parse element
    when "enum"
      Objects::Enumerable.parse element
    when "abstime"
      Objects::Time.parse element
    when "date"
      Objects::Date.parse element
    when "reltime"
      Objects::Duration.parse element
    when "list"
      Objects::List.parse element
    when "op"
      Objects::Operation.parse element
    else
      raise StandardError, "Could not parse #{element}"
    end
  end
end
