require 'rails_helper'

describe 'activities index page' do

  feature 'list activities' do
    scenario 'shows activities in an unsorted list' do
      Activity.create(name: 'drink coffee')
      Activity.create(name: 'stay @home')
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
      Activity.create(name: 'drink coffee')
      visit activities_url
      expect(page).to have_content('drink coffee')
      click_link 'destroy'
      expect(page).to have_no_content('drink coffee')
    end
  end

  feature 'create activity' do
    scenario 'create new Activity' do
      visit new_activity_path
      expect(page).to have_content('Name')
      fill_in 'Name', with: 'TestActivity'
      click_button 'Save'
      expect(page).to have_content('TestActivity')
    end
  end

  feature 'join activity' do
    scenario 'should present a link which allows users to join an activity' do
      Activity.create(name: 'swim')
      visit activities_url
      expect(page).to have_link('join')
    end

    scenario 'should raise an error if user wants to join an activity and is not logged in' do
      Activity.create(name: 'swim')
      visit activities_url
      click_link 'join'
      expect(page).to have_content('You need to be logged in to join an activity!')
    end

    scenario 'should present a notice that user subscribed successfully to an activity' do
      user = create(:user)
      activity = Activity.create(name: 'swim')
      user.activities << activity
      logged_as(user)
      visit activities_url
      click_link 'join'
      expect(page).to have_content('You joined the activity')
    end
  end
end
