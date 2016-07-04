class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :team_invite, :log_in, :log_out, :store_location

  def team_invite
    current_user.invitions.where("accepted IS NULL")
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end
  
  def store_location
    prev = Rails.application.routes.recognize_path(request.referer)
    session[:return_to] = root_path
    session[:return_to] = request.referer if request.get? && prev[:controller] != "session" && prev != {controller:"users", action:"new"}
    puts session[:return_to]
  end

end
