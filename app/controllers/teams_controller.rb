class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @teams = Team.where(captain_id: current_user);
  end

  def create
    @team = Team.create(full_name: team_params[:full_name], country: team_params[:country], image: team_params[:image], captain_id: current_user.id)
    if @team.errors.empty?
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
