require 'rails_helper'

describe Activity do

  it { should have_and_belong_to_many(:users) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe '.send_new_activities_digest' do

    it 'selects all the users which are subscribers' do
      expect(User).to receive_message_chain(:subscribers, :find_each).and_return []
      described_class.send_new_activities_digest
    end

    it 'sends found user as parameter to ActivitiesMailer' do
      allow(User).to receive_message_chain(:subscribers, :find_each).and_yield(:foo).and_yield(:bar)
      mailer_stub = double('mailer', deliver_later: true)
      expect(ActivitiesMailer).to receive(:new_activities_digest).with(:foo).and_return(mailer_stub)
      expect(ActivitiesMailer).to receive(:new_activities_digest).with(:bar).and_return(mailer_stub)
      described_class.send_new_activities_digest
    end

  end

end
