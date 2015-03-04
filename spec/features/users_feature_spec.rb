require 'rails_helper'

describe User do

  it 'allows the user to receive notifications' do
    user = create(:user)
    visit user_url(user.id)
    expect(page).to have_content('Recieve mails for new activities')
  end

  it 'enables notification' do
    user = create(:user)
    visit user_url(user.id)
    page.check('Receive_Mails_for_new_Activites')
    click_link 'Save'
    expect(page).to have_content('You will now receive Notifications.')
  end

  it 'disables notifications' do
    user = create(:user)
    byebug
    visit user_url(user.id)
    click_link 'Save'
    expect(page).to have_content('You will now receive Notifications.')
  end

end
