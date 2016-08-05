class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :team_invite
  
  before_filter :set_gettext_locale, :store_location
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def team_invite
    current_user.invitions.where("accepted IS NULL")
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
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def store_location
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end
  
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

end
