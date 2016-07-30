class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @teams = Team.where(captain_id: current_user);
  end

  def create
    @team = Team.new(team_params)
    @team.captain_id = current_user.id
    @team.users << current_user
    @team.errors
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
