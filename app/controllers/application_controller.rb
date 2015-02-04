class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user

  def index; end

  protected

  #:nocov:
  def current_user
    user_id = session[:user_id]
    return User.new if user_id.blank?
    begin
      @current_user ||= User.find(user_id)
    rescue ActiveRecord::RecordNotFound
      logger.error "Invalid user_id from session: #{user_id}, not matching user found"
    end
    @current_user
  end

  def sign_in_and_redirect(user)
    sessiondata = session.to_hash
    reset_session
    sessiondata.each {|key, val| session[key.to_sym] = val }
    session[:user_id] = user.id
    current_user
    redirect_to root_path and return
  end
  #:nocov:

end
