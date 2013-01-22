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

### Parse an object

```xml
<!-- thermostat.xml -->
<obj href="http://domain/thermostat">
  <real name="spaceTemp" unit="obix:units/fahrenheit" val="67.2"/>
  <real name="setpoint" unit="obix:units/fahrenheit" val="72.0"/>
  <bool name="furnaceOn" val="true"/>
</obj>
```

```ruby
# thermostat.rb
thermostat = OBIX.parse file: "thermostat.xml"

thermostat.href # => "http://domain/thermostat/"

temperature = thermostat.objects.find { |obj| obj.name == "spaceTemp" }
temperature.val # => 67.2
```

### Build an object

```ruby
# thermostat.rb
object = OBIX::Builder.new do |obix|
  obix.obj href: "http://domain/thermostat" do |obix|
    obix.real name: "spaceTemp", unit: "obix:units/fahrenheit" val: 67.2
    obix.real name: "setpoint", unit: "obix:units/fahrenheit" val: 72.0
    obix.bool name: "furnaceOn", val: true
  end
end
```

### Invoke an operation

```xml
<!-- furnace.xml -->
<obj href="http://domain/furnace">
  <bool name="active" val="false"/>
  <op name="activate" href="http://domain/furnace/activate" in="obix:Nil" out="obix:Nil"/>
  <op name="deactivate" href="http://domain/furnace/deactivate" in="obix:Nil" out="obix:Nil"/>
</obj>
```

```ruby
# furnace.rb
furnace = OBIX.parse file: "furnace.xml"

activate = furnace.objects.find { |obj| obj.name == "activate" }
activate.invoke
```

### Create a watch

```ruby
# Create a new watch...
watch = OBIX::Watch.make url: "http://domain/watchservice"

# ... or connect to an existing watch
watch = OBIX::Watch.conncet url: "http://domain/watchservice/watch1"

# Add objects to the watch
watch.add ["/thermostat", "/furnace"]

# Remove objects from the watch
watch.remove ["/furnace"]

# Poll everything
watch.all

# Poll changes
watch.changes

# Delete the watch
watch.delete
```

## Disclaimer

This library is not complete. The following features are missing:

* Contracts.
* Feeds.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
