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
    
    # obix.xml
    <obj href="http://myhome/thermostat">
      <real name="spaceTemp" unit="obix:units/fahrenheit" val="67.2"/>
      <real name="setpoint" unit="obix:units/fahrenheit" val="72.0"/>
      <bool name="furnaceOn" val="true"/>
    </obj>

    # obix.rb
    xml = File.read "obix.xml"

    object = OBIX.parse xml

    object.href           # => "http://myhome/thermostat/"
    object.space_temp.val # => 67.2
    object.setpoint.val   # => 72.0
    object.furnace_on     # => true

## Disclaimer

This library is not complete. The following features are missing:

* Support for parsing relative time objects.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
