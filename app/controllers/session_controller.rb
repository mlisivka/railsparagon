class SessionController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default

  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by_name(params[:name])
    if user
       log_in user
       redirect_to session.delete(:return_to), notice: 'Logged In!'
     else
       render :new
    end
  end

  def destroy
    session[:return_to] = request.referer
    log_out
    redirect_to session.delete(:return_to), notice: 'Logged Out!'
  end

end
