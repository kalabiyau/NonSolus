require 'rails_helper'

describe 'users dashboard page' do

  let(:user) { create(:user) }

  feature 'Receive notification mails if new activities are created' do
    scenario 'Check box if not checked' do
      logged_as(user)
      visit dashboard_url
      check('user_subscriber')
      click_button 'Save'
      expect(page).to have_content('You will now receive Notifications.')
    end

    scenario 'Uncheck box' do
      logged_as(user)
      visit dashboard_url
      click_button 'Save'
      expect(page).to have_content('You just unsubsribed.')
    end
  end
end

