# frozen_string_literal: true

require 'spec_helper'

describe Ios::Devices do
  describe '.search' do
    subject(:model) { Ios::Devices.search(input) }

    it 'returns a model object' do
      model = Ios::Devices.search('iPhone6,2')

      expect(model).to be_a(Ios::Devices::Model)
    end

    it 'returns the correct model' do
      model = Ios::Devices.search('iPad4,3')

      expect(model.name).to eq('iPad Air')
      expect(model.extra).to eq('Rev')
    end

    it 'returns a model object with "Unknown iOS device" for unknown device types' do
      model = Ios::Devices.search('iPad8,13')

      expect(model.name).to eq('Unknown iOS device')
    end

    context 'with Apple Watch5,4' do
      let(:input) { 'Watch5,4' }

      it { expect(model.name).to eq('Apple Watch') }
      it { expect(model.extra).to eq('Series 5, 44mm, GPS+Cellular') }
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
  end
end
