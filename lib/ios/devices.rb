require 'ios/devices/version'
require 'ios/devices/model'

module Ios
  module Devices
    # Gets the official device for the given device type from the iOS devices.
    #
    # Examples:
    #
    #  Ios::Devices.search('iPhone6,1')
    #  => #<Ios::Devices::Model:0x007fa55ba1a948 @extra=nil, @name="iPhone 5s", @name="iPhone6,1">
    #
    #  Ios::Devices.search('iPad2,2')
    #  => #<Ios::Devices::Model:0x007fa55b957308 @extra="GSM", @name="iPad 2", @name="iPad2,2">
    def self.search(device_type)
      # This list was taken from here:
      # http://support.hockeyapp.net/kb/client-integration-ios-mac-os-x/ios-device-types
      case device_type
      when 'x86_64'
        Model.new(device_type, 'iOS Simulator')
      when 'iPhone1,1'
        Model.new(device_type, 'iPhone')
      when 'iPhone1,2'
        Model.new(device_type, 'iPhone 3G')
      when 'iPhone2,1'
        Model.new(device_type, 'iPhone 3GS')
      when 'iPhone3,1'
        Model.new(device_type, 'iPhone 4', 'GSM')
      when 'iPhone3,3'
        Model.new(device_type, 'iPhone 4', 'CDMA')
      when 'iPhone4,1'
        Model.new(device_type, 'iPhone 4S')
      when 'iPhone5,1', 'iPhone5,2'
        Model.new(device_type, 'iPhone 5')
      when 'iPhone5,3', 'iPhone5,4'
        Model.new(device_type, 'iPhone 5c')
      when 'iPhone6,1', 'iPhone6,2'
        Model.new(device_type, 'iPhone 5s')
      when 'iPhone7,1'
        Model.new(device_type, 'iPhone 6 Plus')
      when 'iPhone7,2'
        Model.new(device_type, 'iPhone 6')
      when 'iPhone8,1'
        Model.new(device_type, 'iPhone 6s')
      when 'iPhone8,2'
        Model.new(device_type, 'iPhone 6s Plus')
      when 'iPad1,1'
        Model.new(device_type, 'iPad')
      when 'iPad2,1'
        Model.new(device_type, 'iPad 2', 'Wi-Fi')
      when 'iPad2,2'
        Model.new(device_type, 'iPad 2', 'GSM')
      when 'iPad2,3'
        Model.new(device_type, 'iPad 2', 'CDMA')
      when 'iPad2,4'
        Model.new(device_type, 'iPad 2', 'Wi-Fi, revised')
      when 'iPad2,5'
        Model.new(device_type, 'iPad mini', 'Wi-Fi')
      when 'iPad2,6', 'iPad2,7'
        Model.new(device_type, 'iPad mini')
      when 'iPad3,1'
        Model.new(device_type, 'iPad', '3rd gen, Wi-Fi')
      when 'iPad3,2'
        Model.new(device_type, 'iPad', '3rd gen, Wi-Fi+LTE Verizon')
      when 'iPad3,3'
        Model.new(device_type, 'iPad', '3rd gen, Wi-Fi+LTE AT&T')
      when 'iPad3,4'
        Model.new(device_type, 'iPad', '4th gen, Wi-Fi')
      when 'iPad3,5', 'iPad3,6'
        Model.new(device_type, 'iPad', '4th gen')
      when 'iPad4,1'
        Model.new(device_type, 'iPad Air', 'Wi-Fi')
      when 'iPad4,2'
        Model.new(device_type, 'iPad Air', 'Wi-Fi+LTE')
      when 'iPad4,3'
        Model.new(device_type, 'iPad Air', 'Rev')
      when 'iPad4,4'
        Model.new(device_type, 'iPad mini 2', 'Wi-Fi')
      when 'iPad4,5'
        Model.new(device_type, 'iPad mini 2', 'Wi-Fi+LTE')
      when 'iPad4,6'
        Model.new(device_type, 'iPad mini 2', 'Rev')
      when 'iPad4,7'
        Model.new(device_type, 'iPad mini 3', 'Wi-Fi')
      when 'iPad4,8', 'iPad4,9'
        Model.new(device_type, 'iPad mini 3')
      when 'iPad5,1'
        Model.new(device_type, 'iPad mini 4', 'Wi-Fi')
      when 'iPad5,2'
        Model.new(device_type, 'iPad mini 4', 'Wi-Fi+LTE')
      when 'iPad5,3'
        Model.new(device_type, 'iPad Air 2', 'Wi-Fi')
      when 'iPad5,4'
        Model.new(device_type, 'iPad Air 2', 'Wi-Fi+LTE')
      when 'iPad6,7'
        Model.new(device_type, 'iPad Pro', 'Wi-Fi')
      when 'iPad6,8'
        Model.new(device_type, 'iPad Pro', 'Wi-Fi+LTE')
      when 'iPod1,1'
        Model.new(device_type, 'iPod touch')
      when 'iPod2,1'
        Model.new(device_type, 'iPod touch', '2nd gen')
      when 'iPod3,1'
        Model.new(device_type, 'iPod touch', '3rd gen')
      when 'iPod4,1'
        Model.new(device_type, 'iPod touch', '4th gen')
      when 'iPod5,1'
        Model.new(device_type, 'iPod touch', '5th gen')
      else
        Model.new(device_type, 'Unknown iOS device')
      end
    end
  end
end
