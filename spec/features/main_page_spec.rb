require 'rails_helper'

describe 'Main Page Feature' do

  describe 'main page text' do

    it  'shows text Hello! on the main page' do
      visit '/'
      expect(page).to have_content('Hello!')
    end

  end

end
