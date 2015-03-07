require 'rails_helper'

describe  UsersController do

  describe 'index' do

    xit 'responds successfully with an index of users' do
      create(:user)
      users = User.all
      get :index
      expect(assigns(:users)).to eq(users)
    end

  end

  describe 'show' do

    it 'responds successfully with an user object' do
      user = create(:user)
      get :show, id: user.id
    end

  end

end
