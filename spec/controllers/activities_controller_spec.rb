require 'rails_helper'

describe ActivitiesController do

  let(:user) { create(:user) }

  before do
    request.session[:user_id] = user.id
  end

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
      get :new, format: :js
      expect(assigns(:activity)).to be_a_new(Activity)
    end

  end

  describe 'create' do

    let(:params) { params = FactoryGirl.attributes_for(:activity).merge(category_id: 1) }

    context 'user logged in' do

      it 'assigns @activity variable with Activity instance being built from params' do
        post :create, activity: params
        expect(assigns(:activity).name).to eq params[:name]
      end

      it 'creates an activity' do
        expect do
          post :create, activity: params
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'shows notice in flash if activity created successfully' do
        post :create, activity: params
        expect(flash[:notice]).to eq 'Successfully created Activity'
      end

    end

    context 'guest user' do

      before do
        allow(controller).to receive(:current_user).and_return(nil)
      end

      context 'html format' do

        it 'shows alert if user is not logged in' do
          post :create, activity: params
          expect(flash[:alert]).to eq 'You need to be logged in to proceed!'
        end

      end

      context 'js format' do

        it 'shows alert if user is not logged in' do
          post :create, activity: params, format: :js
          expect(flash[:alert]).to eq 'You need to be logged in to proceed!'
        end

      end

    end

  end

  describe 'show' do

    it 'responds successfully with an acitivity object' do
      activity = create(:activity)
      get :show, id: activity.id
    end

  end

  describe 'destroy' do

    let(:activity) { create(:activity, creator: user) }

    before do
      delete :destroy, id: activity, format: :js
    end

    it 'deletes an activity' do
      expect(Activity.any?).to be false
    end

    it 'renders close modal view' do
      expect(response).to render_template 'activities/_close_modal_rerender'
    end

  end

  describe 'join' do

    it 'alert user if he is not logged in' do
      allow(controller).to receive(:current_user).and_return(nil)
      activity = create(:activity)
      post :join, id: activity
      expect(flash[:alert]).to eq('You need to be logged in to proceed!')
      expect(response).to redirect_to root_url
    end

    it 'informs user that he successfully joined the activity' do
      user = create(:user)
      activity = create(:activity)
      request.session[:user_id] = user.id
      post :join, id: activity.id
      expect(user.activities).to include(activity)
    end

  end

end
