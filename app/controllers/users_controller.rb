class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    store_location
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      log_in @user
      redirect_to session.delete(:return_to), notice: 'Logged In!'
    else
      render "new"
    end
  end

  def show
    @teams = Team.where(captain_id: current_user)
    @team_of_user = User.find(params[:id]).teams # team involving the player
  end

  private
  def user_params
    params.require(:user).permit(:name)#, :password, :confirm_password
  end

end
