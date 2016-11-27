class UsersController < ApplicationController

  def index
    @users = User.all.includes(:teams)
  end

  def show
    if params[:name].nil? && user_signed_in?
      show_my_profile
    elsif !params[:name].nil?
      show_other_profile
    else
      redirect_to login_path and return
    end
    render_404 unless @user
  end
  
  private
  
  def show_my_profile
    @user = current_user
  end
  
  def show_other_profile
    @user = User.where('lower(name) = ?', params[:name].downcase).first
    @teams = current_user.teams
  end

end
