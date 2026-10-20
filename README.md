# iOS Devices

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
  device = Ios::Devices.search('iPhone6,1')
  => #<Ios::Devices::Model:0x007fa55ba1a948 @extra=nil, @name="iPhone 5s", @device_type="iPhone6,1">

  device.name
  => "iPhone 5s"

  device = Ios::Devices.search('iPad2,2')
  => #<Ios::Devices::Model:0x007fa55b957308 @extra="GSM", @name="iPad 2", @device_type="iPad2,2">

  device.name
  => "iPad 2"

  device.extra
  => "GSM"

  device = Ios::Devices.search('iPhone99,1')
  device.name
  => "Unknown iOS device"  # Ios::UNKNOWN_IOS_DEVICE
```

Simulator identifiers (`i386`, `x86_64`, `arm64`) return `"iOS Simulator"`.

## Adding new devices

Device identifiers live in `lib/ios/devices.rb`. When adding new ones:

1. Check the identifiers against a reliable source such as
   [The Apple Wiki](https://theapplewiki.com/wiki/Models) or [ipsw.me](https://ipsw.me).
2. Follow the naming of the existing entries in the same family (iPhone, iPad, Watch, etc.).
3. Make sure the identifier isn't already listed, since a duplicate is silently ignored.
4. Add a spec for at least one of the new identifiers in `spec/ios_devices_spec.rb`.
5. Add an entry to `CHANGELOG.md` under the upcoming version.

Run the tests with `bundle exec rake`.

## Contributing

1. Fork it (https://github.com/rikas/iosdevices/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
