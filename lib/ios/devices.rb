# frozen_string_literal: true

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
      when 'i386', 'x86_64', 'arm64'
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
      when 'iPhone8,4'
        Model.new(device_type, 'iPhone SE')
      when 'iPhone9,1', 'iPhone9,3'
        Model.new(device_type, 'iPhone 7')
      when 'iPhone9,2', 'iPhone9,4'
        Model.new(device_type, 'iPhone 7 Plus')
      when 'iPhone10,1', 'iPhone10,4'
        Model.new(device_type, 'iPhone 8')
      when 'iPhone10,2', 'iPhone10,5'
        Model.new(device_type, 'iPhone 8 Plus')
      when 'iPhone10,3', 'iPhone10,6'
        Model.new(device_type, 'iPhone X')
      when 'iPhone11,2'
        Model.new(device_type, 'iPhone XS')
      when 'iPhone11,6'
        Model.new(device_type, 'iPhone XS Max')
      when 'iPhone11,8'
        Model.new(device_type, 'iPhone XR')
      when 'iPhone12,1'
        Model.new(device_type, 'iPhone 11')
      when 'iPhone12,3'
        Model.new(device_type, 'iPhone 11 Pro')
      when 'iPhone12,5'
        Model.new(device_type, 'iPhone 11 Pro Max')
      when 'iPhone12,8'
        Model.new(device_type, 'iPhone SE', '2nd gen')
      when 'iPhone13,1'
        Model.new(device_type, 'iPhone 12 Mini')
      when 'iPhone13,2'
        Model.new(device_type, 'iPhone 12')
      when 'iPhone13,3'
        Model.new(device_type, 'iPhone 12 Pro')
      when 'iPhone13,4'
        Model.new(device_type, 'iPhone 12 Pro Max')
      when 'iPhone14,2'
        Model.new(device_type, 'iPhone 13 Pro')
      when 'iPhone14,3'
        Model.new(device_type, 'iPhone 13 Pro Max')
      when 'iPhone14,4'
        Model.new(device_type, 'iPhone 13 Mini')
      when 'iPhone14,5'
        Model.new(device_type, 'iPhone 13')
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
      when 'iPad6,3'
        Model.new(device_type, 'iPad Pro 9.7"', 'Wi-Fi')
      when 'iPad6,4'
        Model.new(device_type, 'iPad Pro 9.7"', 'Wi-Fi+LTE')
      when 'iPad6,7'
        Model.new(device_type, 'iPad Pro 12.9"', 'Wi-Fi')
      when 'iPad6,8'
        Model.new(device_type, 'iPad Pro 12.9"', 'Wi-Fi+LTE')
      when 'iPad6,11'
        Model.new(device_type, 'iPad', '5th gen, Wi-Fi')
      when 'iPad6,12'
        Model.new(device_type, 'iPad', '5th gen, Wi-Fi+LTE')
      when 'iPad7,1'
        Model.new(device_type, 'iPad Pro 12.9"', '2nd gen, Wi-Fi')
      when 'iPad7,2'
        Model.new(device_type, 'iPad Pro 12.9"', '2nd gen, Wi-Fi+LTE')
      when 'iPad7,3'
        Model.new(device_type, 'iPad Pro 10.5"', 'Wi-Fi')
      when 'iPad7,4'
        Model.new(device_type, 'iPad Pro 10.5"', 'Wi-Fi+LTE')
      when 'iPad7,5'
        Model.new(device_type, 'iPad', '6rd gen, Wi-Fi')
      when 'iPad7,6'
        Model.new(device_type, 'iPad', '6rd gen, Wi-Fi+LTE')
      when 'iPad7,11'
        Model.new(device_type, 'iPad 10.2"', '7th gen, Wi-Fi')
      when 'iPad7,12'
        Model.new(device_type, 'iPad 10.2"', '7th gen, Wi-Fi+LTE')
      when 'iPad8,1'
        Model.new(device_type, 'iPad Pro 11"', 'Wi-Fi')
      when 'iPad8,2'
        Model.new(device_type, 'iPad Pro 11"', 'Wi-Fi')
      when 'iPad8,3'
        Model.new(device_type, 'iPad Pro 11"', 'Wi-Fi+LTE')
      when 'iPad8,4'
        Model.new(device_type, 'iPad Pro 11"', 'Wi-Fi+LTE')
      when 'iPad8,5'
        Model.new(device_type, 'iPad Pro 12.9"', '3nd gen, Wi-Fi')
      when 'iPad8,6'
        Model.new(device_type, 'iPad Pro 12.9"', '3nd gen, Wi-Fi')
      when 'iPad8,7'
        Model.new(device_type, 'iPad Pro 12.9"', '3nd gen, Wi-Fi+LTE')
      when 'iPad8,8'
        Model.new(device_type, 'iPad Pro 12.9"', '3nd gen, Wi-Fi+LTE')
      when 'iPad8,9'
        Model.new(device_type, 'iPad Pro 11"', '2nd gen, Wi-Fi')
      when 'iPad8,10'
        Model.new(device_type, 'iPad Pro 11"', '2nd gen, Wi-Fi+LTE')
      when 'iPad8,11'
        Model.new(device_type, 'iPad Pro 12.9"', '4th gen, Wi-Fi')
      when 'iPad8,12'
        Model.new(device_type, 'iPad Pro 12.9"', '4th gen, Wi-Fi+LTE')
      when 'iPad11,1'
        Model.new(device_type, 'iPad mini 5', 'Wi-Fi')
      when 'iPad11,2'
        Model.new(device_type, 'iPad mini 5', 'Wi-Fi+LTE')
      when 'iPad11,3'
        Model.new(device_type, 'iPad Air 3', 'Wi-Fi')
      when 'iPad11,4'
        Model.new(device_type, 'iPad Air 3', 'Wi-Fi+LTE')
      when 'iPad11,6'
        Model.new(device_type, 'iPad', '8th gen, Wi-Fi')
      when 'iPad11,7'
        Model.new(device_type, 'iPad', '8th gen, Wi-Fi+LTE')
      when 'iPad12,1'
        Model.new(device_type, 'iPad', '9th gen, Wi-Fi')
      when 'iPad12,2'
        Model.new(device_type, 'iPad', '9th gen, Wi-Fi+LTE')
      when 'iPad13,1'
        Model.new(device_type, 'iPad Air 4', 'Wi-Fi')
      when 'iPad13,2'
        Model.new(device_type, 'iPad Air 4', 'Wi-Fi+LTE')
      when 'iPad13,4'
        Model.new(device_type, 'iPad Pro 11"', '3rd gen, Wi-Fi')
      when 'iPad13,5', 'iPad13,6', 'iPad13,7'
        Model.new(device_type, 'iPad Pro 11"', '3rd gen, Wi-Fi+LTE')
      when 'iPad13,8'
        Model.new(device_type, 'iPad Pro 12.9"', '5th gen, Wi-Fi')
      when 'iPad13,9', 'iPad13,10', 'iPad13,11'
        Model.new(device_type, 'iPad Pro 12.9"', '5th gen, Wi-Fi+LTE')
      when 'iPad14,1'
        Model.new(device_type, 'iPad mini 6', 'Wi-Fi')
      when 'iPad14,2'
        Model.new(device_type, 'iPad mini 6', 'Wi-Fi+LTE')
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
      when 'iPod7,1'
        Model.new(device_type, 'iPod touch', '6th gen')
      when 'iPod9,1'
        Model.new(device_type, 'iPod touch', '7th gen')
      when 'Watch1,1'
        Model.new(device_type, 'Apple Watch', '38mm')
      when 'Watch1,2'
        Model.new(device_type, 'Apple Watch', '42mm')
      when 'Watch2,6'
        Model.new(device_type, 'Apple Watch', 'Series 1, 38mm')
      when 'Watch2,7'
        Model.new(device_type, 'Apple Watch', 'Series 1, 42mm')
      when 'Watch2,3'
        Model.new(device_type, 'Apple Watch', 'Series 2, 38mm')
      when 'Watch2,4'
        Model.new(device_type, 'Apple Watch', 'Series 2, 42mm')
      when 'Watch3,1'
        Model.new(device_type, 'Apple Watch', 'Series 3, 38mm, GPS+Cellular')
      when 'Watch3,2'
        Model.new(device_type, 'Apple Watch', 'Series 3, 42mm, GPS+Cellular')
      when 'Watch3,3'
        Model.new(device_type, 'Apple Watch', 'Series 3, 38mm, GPS')
      when 'Watch3,4'
        Model.new(device_type, 'Apple Watch', 'Series 3, 42mm, GPS')
      when 'Watch4,1'
        Model.new(device_type, 'Apple Watch', 'Series 4, 40mm, GPS')
      when 'Watch4,2'
        Model.new(device_type, 'Apple Watch', 'Series 4, 44mm, GPS')
      when 'Watch4,3'
        Model.new(device_type, 'Apple Watch', 'Series 4, 40mm, GPS+Cellular')
      when 'Watch4,4'
        Model.new(device_type, 'Apple Watch', 'Series 4, 44mm, GPS+Cellular')
      when 'Watch5,1'
        Model.new(device_type, 'Apple Watch', 'Series 5, 40mm, GPS')
      when 'Watch5,2'
        Model.new(device_type, 'Apple Watch', 'Series 5, 44mm, GPS')
      when 'Watch5,3'
        Model.new(device_type, 'Apple Watch', 'Series 5, 40mm, GPS+Cellular')
      when 'Watch5,4'
        Model.new(device_type, 'Apple Watch', 'Series 5, 44mm, GPS+Cellular')
      when 'Watch5,9'
        Model.new(device_type, 'Apple Watch', 'SE, 40mm, GPS')
      when 'Watch5,10'
        Model.new(device_type, 'Apple Watch', 'SE, 44mm, GPS')
      when 'Watch5,11'
        Model.new(device_type, 'Apple Watch', 'SE, 40mm, GPS+Cellular')
      when 'Watch5,12'
        Model.new(device_type, 'Apple Watch', 'SE, 44mm, GPS+Cellular')
      when 'Watch6,1'
        Model.new(device_type, 'Apple Watch', 'Series 6, 40mm, GPS')
      when 'Watch6,2'
        Model.new(device_type, 'Apple Watch', 'Series 6, 44mm, GPS')
      when 'Watch6,3'
        Model.new(device_type, 'Apple Watch', 'Series 6, 40mm, GPS+Cellular')
      when 'Watch6,4'
        Model.new(device_type, 'Apple Watch', 'Series 6, 44mm, GPS+Cellular')
      when 'Watch6,6'
        Model.new(device_type, 'Apple Watch', 'Series 7, 41mm, GPS')
      when 'Watch6,7'
        Model.new(device_type, 'Apple Watch', 'Series 7, 45mm, GPS')
      when 'Watch6,8'
        Model.new(device_type, 'Apple Watch', 'Series 7, 41mm, GPS+Cellular')
      when 'Watch6,9'
        Model.new(device_type, 'Apple Watch', 'Series 7, 45mm, GPS+Cellular')
      else
        Model.new(device_type, 'Unknown iOS device')
      end
    end
  end
end
