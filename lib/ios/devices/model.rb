# frozen_string_literal: true

module Ios
  module Devices
    # Represents an iOS device model. Every device has a type and name and some
    # of them also have extra information (generation, size, connectivity, etc.)
    #
    # Models are immutable and compare equal when all their attributes are equal.
    class Model
      attr_reader :device_type, :name, :extra

      def initialize(device_type, name, extra = nil)
        @device_type = device_type
        @name = name
        @extra = extra
        freeze
      end

      # Whether the device type is in the list of known devices.
      def known?
        name != UNKNOWN_IOS_DEVICE
      end

      def unknown?
        !known?
      end

      # The full model name, e.g. "iPad mini (A17 Pro, Wi-Fi+Cellular)".
      def to_s
        extra ? "#{name} (#{extra})" : name
      end

      def to_h
        { device_type: device_type, name: name, extra: extra }
      end

      def ==(other)
        other.instance_of?(self.class) && other.to_h == to_h
      end
      alias eql? ==

      def hash
        [self.class, device_type, name, extra].hash
      end
    end
  end
end
