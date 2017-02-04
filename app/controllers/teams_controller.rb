class TeamsController < ApplicationController

  def index
    @teams = Team.all.includes(:users)
  end

  def show
    @teams = current_user.teams;
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

  private

  def team_params
    params.require(:team).permit(:full_name, :country, :image)
  end

end
