class ActivitiesController < ApplicationController

  respond_to :html, :js

  def index
    @activities = Activity.filter(filtering_params)
    if request.xhr?
      render @activities
    else
      respond_with(@activities)
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    unless @current_user
      flash.now.alert = 'You need to be logged in to create an activity!'
      render :new and return
    end
    @activity.creator = @current_user
    flash.now.notice = 'Successfully created Activity' if @activity.save
    respond_with(@activity)
  end

  def show
    @activity = Activity.find(params[:id])
    respond_with(@activity)
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
    if @activity.update_attributes(activity_params)
      flash.now.notice = 'Successfull updated Activity'
      respond_with(@activity)
    else
      flash.now.alert = 'Error editing Activity'
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url)
  end

  def join
    @activity = Activity.find(params[:id])
    unless @current_user
      redirect_to @activity, alert: 'You need to be logged in to join an activity!' and return
    end
    @current_user.activities << @activity
    redirect_to activities_url, notice: 'You joined the activity'
  end

  def search
    @activities = Activity.includes(:category, :creator).name_like(search_params[:q])
    render @activities
  end

  private

  def search_params
    params.permit(:q)
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :category_id, :urgent)
  end

  def filtering_params
    params.slice(:urgent, :category)
  end

end
