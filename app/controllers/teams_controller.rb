class TeamsController < ApplicationController

  def index
    @teams = Team.all.includes(:users)
  end

  def show
    @teams = current_user.teams;
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    @team.users << current_user
    if @team.save
      redirect_to teams_path
    else
      render "new"
    end
  end

  def remove_user_from_team
    team = Team.find(params[:id])
    user = User.find(params[:user_id])
    team.users.delete(user) if team.users.first == current_user
    redirect_to team_path(team)
  end

  private

  def team_params
    params.require(:team).permit(:full_name, :country, :image)
  end

end
