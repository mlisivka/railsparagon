class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @teams = Team.where(captainId: current_user);
  end

  def create
    @team = Team.create(name: team_params[:name], country: team_params[:country], image: team_params[:image], captainId: current_user.id)
    if @team.errors.empty?
      redirect_to teams_path
    else
      render "new"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :country, :image)
  end

end
