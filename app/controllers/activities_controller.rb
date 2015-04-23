class ActivitiesController < ApplicationController

  respond_to :js, :html
  before_filter :authorize_user!, only: [ :create, :update, :edit, :destroy, :join, :new ]

  def index
    @activities = Activity.includes(:creator, :category).filter(filtering_params)
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
    @activity.creator = @current_user
    if @activity.save
      respond_with(@activity)
    else
      render :new
    end
  end

  def show
    @activity = Activity.includes(:comments).find(params[:id]).decorate
    @comment = Comment.new
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
    authorize(@activity)
    @activity.destroy
    render partial: 'close_modal_rerender'
  end

  def join
    @activity = Activity.find(params[:id])
    authorize(@activity)
    @participation = Participation.new(user: current_user, activity: @activity)
    if @participation.save
      redirect_to activities_url, notice: 'You joined the activity'
    else
      redirect_to activities_url, alert: @participation.errors.full_messages.to_sentence
    end
  end

  def leave
    @activity = Activity.find(params[:id])
    authorize(@activity)
    @activity.users.destroy(current_user)
    redirect_to activities_url, notice: 'You left activity'
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
    params.require(:activity).permit(:name, :description, :category_id, :urgent, :capacity)
  end

  def filtering_params
    params.slice(:urgent, :category, :creator)
  end

end
