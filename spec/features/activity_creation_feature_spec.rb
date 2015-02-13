require 'rails_helper'

describe 'New Activites Page' do

  feature 'List Activites' do
    scenario 'Check for NonExistence of test creation' do
      visit activities_path
      expect(page).to_not have_content('TestActivity')
    end

    scenario 'Create new Activity' do
      visit new_activity_path
      expect(page).to have_content('Name')
      fill_in 'Name', with: 'TestActivity'
      click_button 'Save'
      expect(page).to have_content('TestActivity')
    end
  end
end
