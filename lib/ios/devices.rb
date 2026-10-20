# frozen_string_literal: true

require 'ios/devices/version'
require 'ios/devices/model'
require 'ios/devices/device_types'

module Ios
  UNKNOWN_IOS_DEVICE = 'Unknown iOS device'

  module Devices
    # Gets the official device for the given device type from the iOS devices.
    #
    # Examples:
    #
    #  Ios::Devices.search('iPhone6,1')
    #  => #<Ios::Devices::Model:0x007fa55ba1a948 @device_type="iPhone6,1", @name="iPhone 5s", @extra=nil>
    #
    #  Ios::Devices.search('iPad2,2')
    #  => #<Ios::Devices::Model:0x007fa55b957308 @device_type="iPad2,2", @name="iPad 2", @extra="GSM">
    #
    # Unknown device types return a Model named Ios::UNKNOWN_IOS_DEVICE.
    def self.search(device_type)
      name, extra = DEVICE_TYPES.fetch(device_type) { [UNKNOWN_IOS_DEVICE] }

      Model.new(device_type, name, extra)
    end
  end
end
