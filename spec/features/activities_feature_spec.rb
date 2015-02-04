require 'rails_helper'

describe 'index page' do
  it 'shows activities in an unsorted list' do
    activity = Activity.create(name: 'drink coffee')
    activity = Activity.create(name: 'stay @home')
    visit activities_url
    expect(page).to have_content('drink coffee')
    expect(page).to have_content('stay @home')
  end
end
