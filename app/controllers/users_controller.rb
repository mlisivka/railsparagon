class UsersController < ApplicationController
  #before_filter :store_location, only:[:new]

  def index
    @users = User.all.includes(:teams)
  end

  def show
    @user = !params[:name].nil? ? User.where('lower(name) = ?', params[:name].downcase).first : current_user
    puts @user.inspect
    render_404 unless @user
    @teams = current_user.teams if user_signed_in?
  end

end
