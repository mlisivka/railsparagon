class SessionController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default
  
  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by_name(params[:name])
    if user
       session[:user_id] = user.id
       redirect_to session.delete(:return_to), notice: 'Logged In!'
     else
       render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged Out!'
  end

end
