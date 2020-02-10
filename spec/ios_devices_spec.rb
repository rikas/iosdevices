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
      model = Ios::Devices.search('iPad8,9')

      expect(model.name).to eq('Unknown iOS device')
    end

    context 'with Apple Watch5,4' do
      let(:input) { 'Watch5,4' }

      it { expect(model.name).to eq('Apple Watch') }
      it { expect(model.extra).to eq('Series 5, 44mm, GPS+Cellular') }
    end
  end
end
