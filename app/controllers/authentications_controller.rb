class AuthenticationsController < ApplicationController
  
  def epic
    @user = User.find(1)
    log_in(@user)
    redirect_to root_path
  end
  
end
