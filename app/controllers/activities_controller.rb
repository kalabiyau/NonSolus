class ActivitiesController < ApplicationController

  respond_to :html, :js

  def index
    @activities = Activity.includes(:category, :creator).all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    unless @current_user
      flash[:alert] = 'You need to be logged in to create an activity!'
      render :new and return
    end
    @activity.creator = @current_user
    flash[:success] = 'Successfully created Activity' if @activity.save
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
    if @activity.update_attributes(activity_params)
      flash[:success] = 'Successfull updated Activity' if @activity.save
      respond_with(@activity)
    else
      flash[:alert] = 'Error editing Activity'
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url)
  end

  def join
    unless @current_user
      flash[:alert] = 'You need to be logged in to join an activity!'
      redirect_to :back and return
    end
    @activity = Activity.find(params[:id])
    @current_user.activities << @activity
    flash[:notice] = 'You joined the activity'
    redirect_to activities_url
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
    params.require(:activity).permit(:name, :description, :category_id)
  end

end
