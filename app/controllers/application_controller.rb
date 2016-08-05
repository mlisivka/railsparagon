class ApplicationController < ActionController::Base
  before_filter :set_gettext_locale

  protect_from_forgery with: :exception
  helper_method :team_invite
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def team_invite
    current_user.invitions.where("accepted IS NULL")
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
    session[:return_to] = request.referer if request.get? && request.referer && prev[:controller] != "session" && prev != {controller: "users", action: "new"}
  end

  def set_gettext_locale
    requested_locale = params[:locale] || session[:locale] || cookies[:locale] ||  request.env['HTTP_ACCEPT_LANGUAGE']
    session[:locale] = FastGettext.set_locale(requested_locale)
  end

  def render_404
    render file: 'public/404.html', status: 404, layout: false
  end

  def render_403
    render file: 'public/403.html', status: 403, layout: false
  end

end
