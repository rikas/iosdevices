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
`Ios::Devices::Model` object. Its `name` is the product name (for example "iPad mini" or
"Apple Watch Series 5"), and its `extra` attribute has details like the generation or chip, size,
connectivity and variant (see [Naming](#naming)).

```ruby
  device = Ios::Devices.search('iPhone6,1')
  => #<Ios::Devices::Model:0x007fa55ba1a948 @device_type="iPhone6,1", @name="iPhone 5s", @extra=nil>

  device.name
  => "iPhone 5s"

  device = Ios::Devices.search('iPad2,2')
  => #<Ios::Devices::Model:0x007fa55b957308 @device_type="iPad2,2", @name="iPad 2", @extra="Wi-Fi+Cellular, GSM">

  device.name
  => "iPad 2"

  device.extra
  => "Wi-Fi+Cellular, GSM"

  device.to_s
  => "iPad 2 (Wi-Fi+Cellular, GSM)"

  device.to_h
  => {device_type: "iPad2,2", name: "iPad 2", extra: "Wi-Fi+Cellular, GSM"}

  device = Ios::Devices.search('iPhone99,1')
  device.name
  => "Unknown iOS device"  # Ios::Devices::UNKNOWN_IOS_DEVICE

  device.known?
  => false
```

Simulator identifiers (`i386`, `x86_64`, `arm64`) return `"iOS Simulator"`.

Models are immutable, and two models with the same attributes are equal (`==`, `eql?` and
`hash`), so they work as hash keys and with `uniq`.

You can also check a device type or list every known device:

```ruby
  Ios::Devices.known?('iPhone6,1')
  => true

  Ios::Devices.all.size
  => 239

  Ios::Devices.all.select { |device| device.name == 'iPad mini' }.map(&:to_s)
  => ["iPad mini (Wi-Fi)", "iPad mini (Wi-Fi+Cellular, GSM)", ...]
```

## Naming

Names follow Apple's official product names, as on Apple's "Identify your model" support pages:

- `name` is Apple's name without the part in brackets: "iPad mini (6th generation)" is
  `"iPad mini"`, "iPad Pro 11-inch (M4)" is `"iPad Pro 11\""`, and "Apple Watch Series 5" stays
  `"Apple Watch Series 5"`. Numbers that are part of the name itself stay (`"iPad mini 4"`,
  `"iPad Air 2"`, `"Apple Watch SE 3"`).
- `extra` is a comma-separated list of what's left, in this order (each part is optional):
  1. generation or chip: `6th gen`, `M4`, `A17 Pro`
  2. size: `44mm`
  3. connectivity: `Wi-Fi`, `Wi-Fi+Cellular`, `GPS`, `GPS+Cellular`
  4. variant: `GSM`, `CDMA`, `China`, `Rev A`, `1TB`

For example, `iPad16,2` is `"iPad mini"` / `"A17 Pro, Wi-Fi+Cellular"` and `Watch6,10` is
`"Apple Watch SE"` / `"2nd gen, 40mm, GPS"`. The specs check that every entry follows these rules.

## Adding new devices

Device identifiers live in the `DEVICE_TYPES` hash in `lib/ios/devices/device_types.rb`, grouped
by family. When adding new ones:

1. Check the identifiers against at least two of these sources:
   - [AppleDB](https://appledb.dev/device-selection/iPhone.html): identifiers per model, including
     upcoming devices (there are pages for iPad, Apple Watch, etc. too).
   - [EveryMac](https://everymac.com/devices/by-identifier/all-iphone-model-identifiers.html):
     identifiers broken down by regional model number (A-number).
   - [adamawolf's gist](https://gist.github.com/adamawolf/3048717): a plain-text
     `identifier : name` list. Its comments often have new devices first, usually taken from
     Xcode betas, but treat those as unconfirmed.

   Identifiers for unreleased devices often show up in Xcode betas before Apple ships the
   hardware, and they can change. Prefer adding them after the device is released.
2. Follow the [naming rules](#naming). If you need a new kind of `extra` part, add it to the
   vocabulary in `spec/device_types_spec.rb`.
3. Make sure the identifier isn't already listed. Ruby warns about duplicate keys and the specs
   fail on them.
4. Add a spec for at least one of the new identifiers in `spec/ios_devices_spec.rb`.
5. Add an entry to `CHANGELOG.md` under the upcoming version.

Run the tests with `bundle exec rake`.

## Contributing

1. Fork it (https://github.com/rikas/iosdevices/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
