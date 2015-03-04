class Api::V1::ActivitiesController < Api::V1::BaseController

  def index
    respond_with(Activity.all)
  end

  def show
    respond_with(Activity.find(params[:id]))
  end

  def search
    respond_with(Activity.name_like(params[:q]))
  end

end
