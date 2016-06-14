class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def team_invite
    current_user.invitions
  end
  helper_method :team_invite

  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user

end
