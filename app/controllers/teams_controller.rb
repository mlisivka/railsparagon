class TeamsController < ApplicationController

  def index
  end

  def create
    @team = Team.create(team_params)
    if @team.errors.empty?
      redirect_to teams_path
    else
      render "new"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :captainId, :country, :image)
  end

end
