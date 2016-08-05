class UsersController < ApplicationController
  #before_filter :store_location, only:[:new]

  def index
    @users = User.all.includes(:teams)
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
    @user = User.where(id: params[:id]).first
    render_404 unless @user
    @teams = current_user.teams if user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
