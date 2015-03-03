require 'rails_helper'

describe ActivitiesMailer do

  describe '.new_activities_digest' do

    let(:user) { build(:user) }
    let!(:activity) { create(:activity) }
    subject { described_class.new_activities_digest(user) }

    it 'sets default from' do
      expect(subject.from).to eq ['no-reply@suse.de']
    end

    it 'sets users email as a receiver' do
      expect(subject.to).to eq [user.email]
    end

    it 'sets users email as a receiver' do
      expect(subject.body.encoded).to match(activity.name)
    end

  end

end
