module ApplicationHelper

  def current_user
    @current_user.try(:decorate)
  end

end
