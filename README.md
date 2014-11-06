[![Build Status](https://travis-ci.org/rikas/iosdevices.svg)](https://travis-ci.org/rikas/iosdevices)

# Ios::Devices

This is a little Gem used to translate Apple iOS device types (like "iPhone6,1") to proper device
names that you can use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ios-devices'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ios-devices

## Usage

Just use the `Ios::Devices.search` method with the Apple string and you should get a
`Ios::Devices::Model` object. This object has an `extra` attribute for things like internet
connection, revision model, etc.

```ruby
  Ios::Devices.search('iPhone6,1')
  => #<Ios::Devices::Model:0x007fa55ba1a948 @extra=nil, @name="iPhone 5s", @device_type="iPhone6,1">

  Ios::Devices.search('iPad2,2')
  => #<Ios::Devices::Model:0x007fa55b957308 @extra="GSM", @name="iPad 2", @device_type="iPad2,2">
```

## Contributing

1. Fork it ( https://github.com/rikas/ios-devices/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
