# OBIX

[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/obix.svg?style=flat)](https://codeclimate.com/github/hyperoslo/obix)

Ruby OBIX parser.

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
object = OBIX::Builder.new do
  obj href: "http://domain/thermostat" do
    real name: "spaceTemp", unit: "obix:units/fahrenheit" val: 67.2
    real name: "setpoint", unit: "obix:units/fahrenheit" val: 72.0
    bool name: "furnaceOn", val: true
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
watch = OBIX::Watch.connect url: "http://domain/watchservice/watch1"

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

### Query an object's history

```ruby
history = OBIX::History.new url: "http://domain/history"

history.query start: 2.year.ago, end: 1.year.ago
```

### Query alarms

```ruby
alarms = OBIX::Alarms.new url: "http://domain/alarmservice"

alarms.query start: 2.years.ago, end: 1.year.ago
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Hyper made this. We're a digital communications agency with a passion for good code,
and if you're using this library we probably want to hire you.
