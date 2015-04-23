require 'rails_helper'

describe ActivityPolicy do

  subject { described_class }

  permissions :update? do

    it 'allows update when user is creator' do
      user = build(:user)
      activity = build(:activity, creator: user)
      expect(subject).to permit(user, activity)
    end

    it 'disallows update when user is not creator' do
      user = build(:user)
      activity = build(:activity, creator: user)
      expect(subject).not_to permit(User.new, activity)
    end

  end

  permissions :leave? do

    it 'allows leave when user is participant' do
      user = build(:user)
      activity = build(:activity)
      activity.users = [ user ]
      expect(subject).to permit(user, activity)
    end

    it 'disallows leave when user is not participant' do
      user = build(:user)
      activity = build(:activity)
      activity.users = [ ]
      expect(subject).not_to permit(user, activity)
    end

  end

end
