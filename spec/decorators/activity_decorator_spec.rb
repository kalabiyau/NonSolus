require 'rails_helper'

describe ActivityDecorator do

  context 'limited capacity' do

    let(:activity) { build(:activity, capacity: 12) }

    it 'shows digit of capacity via slash with current usage' do
      expect(described_class.new(activity).capacity_numbers).to eq '0/12'
    end

  end

  context 'unlimited capacity' do

    let(:activity) { build(:activity, capacity: 0) }

    it 'shows digit of capacity via slash with infinity html code' do
      expect(described_class.new(activity).capacity_numbers).to eq '0/&infin;'
    end

  end
end
