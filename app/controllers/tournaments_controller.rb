class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @captain = Team.where(id: params[:team_id], captain_id: current_user)
    @current_team = Team.find_by_id(params[:team_id])
    tournament = Tournament.find(params[:id])
    @registered_team = tournament.teams

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def update
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.errors.empty?
      redirect_to tournaments_path
    else
      render "new"
    end
  end
  
  def registration_team
    @tournament = Tournament.find(params[:id])
    @team = Team.find(params[:team_id])
    @tournament.teams << @team unless @tournament.teams.include?(@team)
    respond_to do |format|
        format.js {}
    end
    
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :tournament_begins, :max_team, :payment, :prize)
  end

end
