require 'rails_helper'

describe 'Main Page Feature' do

  describe 'main page text' do

    it  'shows link New on the main page' do
      visit '/'
      expect(page).to have_link('add an activity', activities_url)
    end

    it  'shows text Fellow Rubyist!' do
      activity = create(:activity)
      visit '/'
      expect(page).to have_content(activity.name)
    end

  end

end
