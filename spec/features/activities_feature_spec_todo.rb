require 'rails_helper'

describe 'activities index page', js: true do

  let(:user) { create(:user) }
  let(:activity) { build(:activity) }

  def create_activity(activity)
    logged_as(user)
    visit root_path
    click_link 'add an activity'
    fill_in 'activity_name', with: activity.name
    fill_in 'activity_description', with: activity.description
    within('.category') do
      first('input').click
    end
    page.body
    find('#activity_urgent_false').click
    click_button 'Create Activity'
    expect(page).to have_content(activity.name)
  end

  feature 'list activities' do

    scenario 'shows activities in an unsorted list' do
      create_activity(activity)
      visit activities_path
      expect(page).to have_content(activity.name)
      expect(page).to have_content(activity.description)
    end

    scenario 'Check for NonExistence of test creation' do
      visit activities_path
      expect(page).to_not have_content('TestActivity')
    end

  end

  feature 'delete activity' do

    scenario 'each activity has a link which deletes activity and redirects back to index page' do
      create_activity(activity)
      visit root_path
      first('.activity').click
      click_link 'Destroy'
      visit root_path
      expect(page).to have_no_content(activity.name)
    end

  end

  feature 'create activity' do

    scenario 'create new Activity' do
      create_activity(activity)
      expect(page).to have_content(activity.name)
      expect(page).to have_content(activity.description)
    end
  end

  feature 'join activity' do
    scenario 'should present a link which allows users to join an activity' do
      create(:activity)
      logged_as(user)
      visit root_path
      first('.activity').click()
      expect(page).to have_link('Join')
    end

    scenario 'should present a notice that user joined successfully to an activity' do
      create(:activity)
      logged_as(user)
      visit root_path
      first('.activity').click()
      click_link 'Join'
      expect(page).to have_content('You joined the activity')
    end

  end

end
