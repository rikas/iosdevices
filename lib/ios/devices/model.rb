module Ios
  module Devices
    # Represents an iOS device model. Every device has a type and name and some of them also have
    # extra information (Revision, Wi-fi, etc.)
    class Model
      attr_accessor :device_type, :name, :extra

      def initialize(device_type, name, extra = nil)
        @device_type = device_type
        @name = name
        @extra = extra
      end
    end
  end
end
