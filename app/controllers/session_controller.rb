class SessionController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default

  def new
    store_location
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
    store_location
    log_out
    redirect_to session.delete(:return_to), notice: 'Logged Out!'
  end
  
  private

  def redirect_to_default
    redirect_to root_path
  end

end
