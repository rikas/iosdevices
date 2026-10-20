# frozen_string_literal: true

require 'spec_helper'

describe 'Ios::Devices::DEVICE_TYPES' do
  subject(:device_types) { Ios::Devices.const_get(:DEVICE_TYPES) }

  let(:simulators) { %w[i386 x86_64 arm64] }
  let(:source) { File.read(File.expand_path('../lib/ios/devices/device_types.rb', __dir__)) }

  it 'has no duplicate device types' do
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

  it 'is frozen' do
    expect(device_types).to be_frozen
    expect(device_types.values).to all(be_frozen)
  end
end
