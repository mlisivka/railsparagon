class TeamFactoryController < ApplicationController
  
  before_filter :authenticate_user!, only: :new
  
  def create
    if current_user.update_attributes(email: params[:email], without_team: true)
      redirect_to root_path, notice: _('We are already looking for a proper team')
    else
      render 'new'
    end
  end
  
end
