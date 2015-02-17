require 'rails_helper'

describe 'index page' do
  it 'shows activities in an unsorted list' do
    activity = Activity.create(name: 'drink coffee')
    activity = Activity.create(name: 'stay @home')
    visit activities_url
    expect(page).to have_content('drink coffee')
    expect(page).to have_content('stay @home')
  end

  it 'each activity has a link which deletes activity and redirects back to index page' do
    activity = Activity.create(name: 'drink coffee')
    visit activities_url
    expect(page).to have_content('drink coffee')
    click_link 'destroy'
    page.should have_no_content('drink coffee')
  end
end
