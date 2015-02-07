require 'rails_helper'

describe User do

  subject { create(:user) }

  it 'validates presence of first_name' do
    user = build(:user, first_name: nil)
    user.should_not be_valid
  end

  it 'validates presence of last_name' do
    user = build(:user, last_name: nil)
    user.should_not be_valid
  end

  describe '.find_or_create_for_saml' do

    it 'finds the right instance for SAML' do
      auth_hash = { novell_username: subject.novell_username }
      expect(User.find_or_create_for_saml(auth_hash)).to eq subject
    end

    it 'creates a new instance for SAML if necessary' do
      user_count = User.count
      auth_hash = { novell_username: 'test', first_name: 'test', last_name: 'test', email: 'test' }
      User.find_or_create_for_saml(auth_hash)
      expect(User.count).to eq(user_count + 1)
    end

  end

  it { should have_and_belong_to_many(:activities) }

end
