require 'rails_helper'

describe User do

  subject { create(:user) }
   
  it { should validate_presence_of(:first_name) }
  # it { should validate_presence_of(:last_name) }

  describe '.find_or_create_for_saml' do

    it 'finds the right instance for SAML' do
      auth_hash = { username: subject.username, workforceid: subject.workforceid }
      expect(User.find_or_create_for_saml(auth_hash)).to eq subject
    end

    it 'creates a new instance for SAML if necessary' do
      user_count = User.count
      auth_hash = { username: 'test', first_name: 'test', last_name: 'test', email: 'test', workforceid: '121242' }
      User.find_or_create_for_saml(auth_hash)
      expect(User.count).to eq(user_count + 1)
    end

  end

end
