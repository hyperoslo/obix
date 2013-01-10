require "obix/version"
require "nokogiri"

module OBIX
  autoload :Objects, "obix/objects"
  autoload :Types, "obix/types"
  autoload :Watch, "obix/watch"
  autoload :Tag, "obix/tag"
  autoload :Builder, "obix/builder"
  autoload :Configuration, "obix/configuration"

  # Parse the given source as OBIX.
  #
  # source  - A Hash describing the source.
  #           :string - A String describing oBIX data.
  #           :file   - A String describing a file that contains oBIX data.
  #           :url    - A String describing a URL that the oBIX data may be loaded from. If the
  #                     server requires authentication, you may embed your credentials
  #                     in the URL (e.g. "username:password@host").
  #
  # Returns an OBIX::Object instance.
  def self.parse source
    string = source[:string]
    url    = source[:url]
    file   = source[:file]

    if url
      if match = url.match(/^(.+):(.+)@(.+)$/)
        configure do |c|
          c.username = match[1]
          c.password = match[2]
        end

        url      = match[3]
      end

      url = URI url

      response = Net::HTTP.start url.host, url.port do |http|
        request = Net::HTTP::Get.new url.path
        request.basic_auth configuration.username, configuration.password

        http.request request
      end

      string = response.body
    end

    if file
      string = File.read file
    end

    document = Nokogiri::XML.parse string do |config|
      config.noblanks
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
