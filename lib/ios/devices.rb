# frozen_string_literal: true

require 'ios/devices/version'
require 'ios/devices/model'
require 'ios/devices/device_types'

module Ios
  module Devices
    UNKNOWN_IOS_DEVICE = 'Unknown iOS device'

    # Models are immutable, so every known device type gets one shared instance.
    MODELS = DEVICE_TYPES.to_h do |device_type, (name, extra)|
      [device_type, Model.new(device_type, name, extra)]
    end.freeze
    private_constant :MODELS

    # Gets the official device for the given device type from the iOS devices.
    #
    # Examples:
    #
    #  Ios::Devices.search('iPhone6,1')
    #  => #<Ios::Devices::Model:0x007fa55ba1a948 @device_type="iPhone6,1", @name="iPhone 5s", @extra=nil>
    #
    #  Ios::Devices.search('iPad2,2')
    #  => #<Ios::Devices::Model:0x007fa55b957308 @device_type="iPad2,2", @name="iPad 2", @extra="Wi-Fi+Cellular, GSM">
    #
    # Unknown device types return a Model named Ios::Devices::UNKNOWN_IOS_DEVICE.
    def self.search(device_type)
      MODELS.fetch(device_type) { Model.new(device_type, UNKNOWN_IOS_DEVICE) }
    end

    # Whether the given device type is in the list of known devices.
    #
    #  Ios::Devices.known?('iPhone6,1') # => true
    #  Ios::Devices.known?('iPhone0,0') # => false
    def self.known?(device_type)
      MODELS.key?(device_type)
    end

    # All known device models, grouped by family (simulators, iPhone, iPad, iPod
    # touch, Apple Watch).
    #
    #  Ios::Devices.all.select { |model| model.name == 'iPad mini' }
    def self.all
      MODELS.values
    end
  end

  # Deprecated: use Ios::Devices::UNKNOWN_IOS_DEVICE. Ruby warns about it when
  # deprecation warnings are on (ruby -W:deprecated).
  UNKNOWN_IOS_DEVICE = Devices::UNKNOWN_IOS_DEVICE
  deprecate_constant :UNKNOWN_IOS_DEVICE
end
