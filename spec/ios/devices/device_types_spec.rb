# frozen_string_literal: true

require 'spec_helper'

describe 'Ios::Devices::DEVICE_TYPES' do
  subject(:device_types) { Ios::Devices.const_get(:DEVICE_TYPES) }

  let(:simulators) { %w[i386 x86_64 arm64] }
  # Each part of an extra must belong to one of these groups, in this order.
  let(:extra_groups) do
    [
      /\A(\d+(st|nd|rd|th) gen|M\d+|A\d+( Pro)?)\z/, # generation or chip
      /\A\d+mm\z/, # size
      /\A(Wi-Fi|Wi-Fi\+Cellular|GPS|GPS\+Cellular)\z/, # connectivity
      /\A(GSM|CDMA|China|Rev A|1TB)\z/ # variant
    ]
  end
  let(:source) { File.read(File.expand_path('../../../lib/ios/devices/device_types.rb', __dir__)) }

  it 'has no duplicate device types', :aggregate_failures do
    # Duplicate hash keys silently overwrite each other, so check the source.
    keys = source.scan(/^\s*'([^']+)' =>/).flatten
    duplicates = keys.tally.select { |_, count| count > 1 }.keys

    expect(duplicates).to be_empty
    expect(keys.size).to eq(device_types.size)
  end

  it 'only has valid device types' do
    invalid = device_types.keys.reject do |device_type|
      simulators.include?(device_type) || device_type.match?(/\A(iPhone|iPad|iPod|Watch)\d+,\d+\z/)
    end

    expect(invalid).to be_empty
  end

  it 'has a name for every device type' do
    invalid = device_types.reject { |_, (name, _)| name.is_a?(String) && name == name.strip && !name.empty? }

    expect(invalid).to be_empty
  end

  it 'has either no extra or a non-empty extra for every device type' do
    invalid = device_types.reject do |_, value|
      extra = value[1]

      value.size.between?(1, 2) && (extra.nil? || (extra.is_a?(String) && extra == extra.strip && !extra.empty?))
    end

    expect(invalid).to be_empty
  end

  it 'keeps generations out of names' do
    # Apple's "iPad mini (6th generation)" is 'iPad mini' with '6th gen' in extra.
    invalid = device_types.select { |_, (name, _)| name.match?(/\d(st|nd|rd|th) gen/i) || name.include?('Mini') }

    expect(invalid).to be_empty
  end

  it 'uses a consistent vocabulary and order in extras' do
    invalid = device_types.reject do |_, (_, extra)|
      indexes = extra.to_s.split(', ').map { |part| extra_groups.index { |group| part.match?(group) } }

      indexes.none?(&:nil?) && indexes == indexes.sort
    end

    expect(invalid).to be_empty
  end

  it 'is frozen', :aggregate_failures do
    expect(device_types).to be_frozen
    expect(device_types.values).to all(be_frozen)
  end
end
