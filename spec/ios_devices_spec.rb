# frozen_string_literal: true

require 'spec_helper'

describe Ios::Devices do
  describe '.search' do
    subject(:model) { Ios::Devices.search(input) }

    context 'with a known device type' do
      let(:input) { 'iPhone6,2' }

      it { is_expected.to be_a(Ios::Devices::Model) }
      it { expect(model.device_type).to eq('iPhone6,2') }
      it { expect(model.name).to eq('iPhone 5s') }
      it { expect(model.extra).to be_nil }
    end

    context 'with an unknown device type' do
      let(:input) { 'iPad8,13' }

      it { is_expected.to be_a(Ios::Devices::Model) }
      it { expect(model.device_type).to eq('iPad8,13') }
      it { expect(model.name).to eq(Ios::UNKNOWN_IOS_DEVICE) }
      it { expect(model.extra).to be_nil }
    end

    context 'with nil' do
      let(:input) { nil }

      it { expect(model.name).to eq(Ios::UNKNOWN_IOS_DEVICE) }
    end

    %w[i386 x86_64 arm64].each do |simulator|
      context "with simulator #{simulator}" do
        let(:input) { simulator }

        it { expect(model.name).to eq('iOS Simulator') }
        it { expect(model.extra).to be_nil }
      end
    end

    context 'with iPhone1,1' do
      let(:input) { 'iPhone1,1' }

      it { expect(model.name).to eq('iPhone') }
    end

    context 'with iPhone3,3' do
      let(:input) { 'iPhone3,3' }

      it { expect(model.name).to eq('iPhone 4') }
      it { expect(model.extra).to eq('CDMA') }
    end

    context 'with iPhone12,8' do
      let(:input) { 'iPhone12,8' }

      it { expect(model.name).to eq('iPhone SE') }
      it { expect(model.extra).to eq('2nd gen') }
    end

    context 'with iPhone18,5' do
      let(:input) { 'iPhone18,5' }

      it { expect(model.name).to eq('iPhone 17e') }
    end

    context 'with iPhone19,2' do
      let(:input) { 'iPhone19,2' }

      it { expect(model.name).to eq('iPhone 18 Pro') }
    end

    context 'with iPhone19,3' do
      let(:input) { 'iPhone19,3' }

      it { expect(model.name).to eq('iPhone 18 Pro Max') }
    end

    context 'with iPhone19,7' do
      let(:input) { 'iPhone19,7' }

      it { expect(model.name).to eq('iPhone 18 Pro Max') }
    end

    context 'with iPhone19,4' do
      let(:input) { 'iPhone19,4' }

      it { expect(model.name).to eq('iPhone Duo') }
    end

    context 'with iPad2,2' do
      let(:input) { 'iPad2,2' }

      it { expect(model.name).to eq('iPad 2') }
      it { expect(model.extra).to eq('GSM') }
    end

    context 'with iPad4,3' do
      let(:input) { 'iPad4,3' }

      it { expect(model.name).to eq('iPad Air') }
      it { expect(model.extra).to eq('Rev') }
    end

    context 'with iPad16,3' do
      let(:input) { 'iPad16,3' }

      it { expect(model.name).to eq('iPad Pro 11"') }
      it { expect(model.extra).to eq('M4, Wi-Fi') }
    end

    context 'with iPad17,4' do
      let(:input) { 'iPad17,4' }

      it { expect(model.name).to eq('iPad Pro 13"') }
      it { expect(model.extra).to eq('M5, Wi-Fi+LTE') }
    end

    context 'with iPod1,1' do
      let(:input) { 'iPod1,1' }

      it { expect(model.name).to eq('iPod touch') }
      it { expect(model.extra).to be_nil }
    end

    context 'with iPod9,1' do
      let(:input) { 'iPod9,1' }

      it { expect(model.name).to eq('iPod touch') }
      it { expect(model.extra).to eq('7th gen') }
    end

    context 'with Watch1,1' do
      let(:input) { 'Watch1,1' }

      it { expect(model.name).to eq('Apple Watch') }
      it { expect(model.extra).to eq('38mm') }
    end

    context 'with Watch5,4' do
      let(:input) { 'Watch5,4' }

      it { expect(model.name).to eq('Apple Watch') }
      it { expect(model.extra).to eq('Series 5, 44mm, GPS+Cellular') }
    end

    context 'with Watch7,12' do
      let(:input) { 'Watch7,12' }

      it { expect(model.name).to eq('Apple Watch') }
      it { expect(model.extra).to eq('Ultra 3') }
    end

    context 'with Watch7,20' do
      let(:input) { 'Watch7,20' }

      it { expect(model.name).to eq('Apple Watch') }
      it { expect(model.extra).to eq('Series 11, 46mm, GPS+Cellular') }
    end
  end
end
