require 'rails_helper'

describe Participation do

  subject { build(:participation) }

  it { should belong_to(:user) }
  it { should belong_to(:activity) }

  describe 'capacity' do

    it 'disallows to join if capacity is reached' do
      subject.activity.capacity = 5
      allow(subject.activity).to receive(:full?).and_return(true)
      expect{ subject.valid? }.to change{ subject.errors[:activity] }.to include('is fully booked')
    end

  end


end
