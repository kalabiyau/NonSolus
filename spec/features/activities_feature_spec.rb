require 'rails_helper'

describe 'activities index page' do

  let(:user) { create(:user) }

  def fill_out_activity_form
    fill_in 'Name', with: 'TestActivity'
    fill_in 'Description', with: 'test description to test activity description'
    select 'Other', from: 'activity_category_id'
  end

  feature 'list activities' do
    scenario 'shows activities in an unsorted list' do
      create(:activity, name: 'drink coffee')
      create(:activity, name: 'stay @home')
      visit activities_url
      expect(page).to have_content('drink coffee')
      expect(page).to have_content('stay @home')
    end

    scenario 'Check for NonExistence of test creation' do
      visit activities_path
      expect(page).to_not have_content('TestActivity')
    end
  end

  feature 'delete activity' do
    scenario 'each activity has a link which deletes activity and redirects back to index page' do
      logged_as(user)
      visit new_activity_url
      fill_out_activity_form
      click_button 'Save'
      visit activities_url
      expect(page).to have_content('TestActivity')
      click_link 'Destroy'
      visit activities_url
      expect(page).to have_no_content('TestActivity')
    end
  end

  feature 'create activity' do

    scenario 'create new Activity' do
      logged_as(user)
      visit new_activity_path
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      fill_out_activity_form
      click_button 'Save'
      expect(page).to have_content('TestActivity')
      expect(page).to have_content('test description to test activity description')
    end
  end

  feature 'join activity' do
    scenario 'should present a link which allows users to join an activity' do
      create(:activity)
      visit activities_url
      expect(page).to have_link('Join')
    end

    scenario 'should present a notice that user subscribed successfully to an activity' do
      user = create(:user)
      create(:activity)
      logged_as(user)
      visit activities_url
      click_link 'Join'
      expect(page).to have_content('You joined the activity')
    end

    scenario 'should redirect to index page if user already joined activity' do
      user = create(:user)
      activity = create(:activity)
      logged_as(user)
      visit activities_url
      click_link 'Join'
      expect(page).to have_content 'You joined the activity'
      click_link 'Join'
      expect(current_url).to eq activities_url
      expect(page).to have_content 'User cannot join same activity twice'
    end
  end

  feature 'leave activity' do
    scenario 'should present a link which allows user to leave an activity' do
      user = create(:user)
      activity = create(:activity)
      user.activities << activity
      logged_as(user)
      visit activity_url(activity)
      expect(page).to have_link('Leave')
    end
  end
end
