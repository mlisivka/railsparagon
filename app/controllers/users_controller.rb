class UsersController < ApplicationController

  def index
    @users = User.all.includes(:teams)
  end

  def show
    if user_signed_in?
      @user = !params[:name].nil? ? User.where('lower(name) = ?', params[:name].downcase).first : current_user
      @teams = current_user.teams
    else
      unless params[:name].nil?
        @user = User.where('lower(name) = ?', params[:name].downcase).first
      else
        redirect_to login_path and return
      end
    end
    render_404 unless @user
  end

end
