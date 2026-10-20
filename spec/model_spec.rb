# frozen_string_literal: true

require 'spec_helper'

describe Ios::Devices::Model do
  subject(:model) { described_class.new('iPad16,2', 'iPad mini', 'A17 Pro, Wi-Fi+Cellular') }

  let(:without_extra) { described_class.new('iPhone6,1', 'iPhone 5s') }
  let(:unknown) { described_class.new('iPhone0,0', Ios::Devices::UNKNOWN_IOS_DEVICE) }

  it { is_expected.to be_frozen }
  it { is_expected.not_to respond_to(:name=) }

  describe '#known?' do
    it { expect(model).to be_known }
    it { expect(unknown).not_to be_known }
  end

  describe '#unknown?' do
    it { expect(model).not_to be_unknown }
    it { expect(unknown).to be_unknown }
  end

  describe '#to_s' do
    it { expect(model.to_s).to eq('iPad mini (A17 Pro, Wi-Fi+Cellular)') }
    it { expect(without_extra.to_s).to eq('iPhone 5s') }
  end

  describe '#to_h' do
    it do
      expect(model.to_h).to eq(device_type: 'iPad16,2', name: 'iPad mini', extra: 'A17 Pro, Wi-Fi+Cellular')
    end
  end

  describe 'equality' do
    let(:same) { described_class.new('iPad16,2', 'iPad mini', 'A17 Pro, Wi-Fi+Cellular') }

    it { expect(model).to eq(same) }
    it { expect(model).to eql(same) }
    it { expect(model.hash).to eq(same.hash) }
    it { expect([model, same].uniq.size).to eq(1) }
    it { expect(model).not_to eq(described_class.new('iPad16,1', 'iPad mini', 'A17 Pro, Wi-Fi')) }
    it { expect(model).not_to eq(model.to_h) }
  end
end
