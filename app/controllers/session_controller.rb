class SessionController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default
  before_filter :store_location, only:[:new, :destroy]

  def create
    user = User.where(name: params[:name]).first
    if user
       log_in user
       redirect_to session.delete(:return_to), notice: 'Logged In!'
     else
       render :new
    end
  end

  def destroy
    log_out
    redirect_to session.delete(:return_to), notice: 'Logged Out!'
  end
  
  private

  def redirect_to_default
    redirect_to root_path
  end

end
