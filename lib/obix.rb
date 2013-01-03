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
    when "str"
      Objects::String.parse element
    when "enum"
      Objects::Enumerable.parse element
    when "abstime"
      Objects::Time.parse element
    when "date"
      Objects::Date.parse element
    else
      raise StandardError, "Could not parse #{element}"
    end
  end
end
