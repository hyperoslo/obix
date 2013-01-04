# OBIX

Ruby oBIX parser.

## Installation

Add this line to your application's Gemfile:

    gem 'obix'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install obix

## Usage
    
    # thermostat.xml
    <obj href="http://myhome/thermostat">
      <real name="spaceTemp" unit="obix:units/fahrenheit" val="67.2"/>
      <real name="setpoint" unit="obix:units/fahrenheit" val="72.0"/>
      <bool name="furnaceOn" val="true"/>
    </obj>

    # obix.rb
    xml = File.read "thermostat.xml"

    thermostat = OBIX.parse xml

    thermostat.href # => "http://myhome/thermostat/"

    temperature = thermostat.objects.find { |obj| obj.name == "spaceTemp" }
    temperature.val # => 67.2

    furnace_on = thermostat.objects.find { |obj| obj.name = "furnaceOn" }
    furnace_on.val # => true

## Disclaimer

This library is not complete. The following features are missing:

* Support for contracts.
* Support for relative time.
* Support for URI references.
* Support for oBIX references.
* Support for errors.
* Support for operations.
* Support for feeds.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
