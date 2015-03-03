require 'rails_helper'

describe ActivitiesController do

  describe 'index' do
    it 'responds successfully with an index of activities' do
      create(:activity)
      activities = Activity.all
      get :index
      expect(assigns(:activities)).to eq(activities)
    end
 end

  describe 'new' do
    it 'assigns a new activity to @activity instance' do
      create(:activity)
      get :new
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe 'create' do
    it 'assigns @activity variable with Activity instance being built from params' do
      post :create, activity: FactoryGirl.attributes_for(:activity)
      expect(flash[:success]).to eq("Successfully created Activity")
      expect(response).to redirect_to Activity.last
    end
  end

  describe 'show' do
    it 'responds successfully with an acitivity object' do
      activity = create(:activity)
      get :show, id: activity.id
    end
  end

  describe 'destroy' do
    it 'deletes an activity' do
      activity = create(:activity)
      delete :destroy, id: activity
      expect(response).to redirect_to activities_url
    end
  end

  describe 'join' do
    it 'alert user if he is not logged in' do
      activity = create(:activity)
      request.env['HTTP_REFERER'] = activities_url
      post :join, id: activity
      expect(@current_user).to be nil
      expect(flash[:alert]).to eq("You need to be logged in to join an activity!")
      expect(response).to redirect_to activities_url
    end

    xit 'informs user that he successfully joined the activity' do
      user = create(:user)
      activity = create(:activity)
      logged_as(user)
      post :join, id: activity.id
      expect(user.activities).to include(activity)
    end
  end

end
