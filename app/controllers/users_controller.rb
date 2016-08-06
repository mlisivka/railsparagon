class UsersController < ApplicationController
  #before_filter :store_location, only:[:new]

  def index
    @users = User.all.includes(:teams)
  end

  def show
    @user = User.where(id: params[:id]).first
    render_404 unless @user
    @teams = current_user.teams if user_signed_in?
  end

end
