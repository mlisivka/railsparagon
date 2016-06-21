class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :team_invite

  def team_invite
    current_user.invitions.where("accepted IS NULL")
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end
