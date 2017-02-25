class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :team_invite, :current_user

  before_filter :set_gettext_locale, :store_location

  def team_invite
    current_user.invitions.where("accepted IS NULL") if current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    redirect_to root_path
  end
  
  def authenticate_user!
      redirect_to login_path unless current_user
  end 

  def set_gettext_locale
    requested_locale = params[:locale] || session[:locale] || cookies[:locale] ||  request.env['HTTP_ACCEPT_LANGUAGE']
    session[:locale] = FastGettext.set_locale(requested_locale)
  end

  private
  
  def store_location
     if request.get? && request.path != "/auth/epic/callback"
       session[:previous_url] = request.fullpath
     end
   end

  def after_sign_in_path_for
    session[:previous_url] || root_path
  end
  
  def render_404
    render file: 'public/404.html', status: 404, layout: false
  end

  def render_403
    render file: 'public/403.html', status: 403, layout: false
  end

end
