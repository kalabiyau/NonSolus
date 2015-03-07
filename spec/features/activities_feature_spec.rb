require 'rails_helper'

describe 'activities index page' do

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
      create(:activity, name: 'drink coffee')
      visit activities_url
      expect(page).to have_content('drink coffee')
      click_link 'Destroy'
      expect(page).to have_no_content('drink coffee')
    end
  end

  feature 'create activity' do

    let(:user) { create(:user) }

    scenario 'create new Activity' do
      logged_as(user)
      visit new_activity_path
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      fill_in 'Name', with: 'TestActivity'
      fill_in 'Description', with: 'test description to test activity description'
      select 'Other', from: 'activity_category_id'
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

    scenario 'should raise an error if user wants to join an activity and is not logged in' do
      create(:activity)
      visit activities_url
      click_link 'Join'
      expect(page).to have_content('You need to be logged in to join an activity!')
    end

    scenario 'should present a notice that user subscribed successfully to an activity' do
      user = create(:user)
      activity = create(:activity)
      user.activities << activity
      logged_as(user)
      visit activities_url
      click_link 'Join'
      expect(page).to have_content('You joined the activity')
    end
  end
end
