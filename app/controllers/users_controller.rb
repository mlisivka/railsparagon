class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @teams = Team.where(captain_id: current_user)
  end

end
