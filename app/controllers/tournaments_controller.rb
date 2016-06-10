class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @teams = Team.where(captain_id: current_user)
    @captain = Team.where(id: params[:team_id], captain_id: current_user)
    @current_team = Team.find_by_id(params[:team_id])

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def update
    @tournament = Tournament.find_by_id(params[:id])
    @tournament.update(team_id: params[:team_id])
    if @tournament.errors.empty?
      redirect_to tournaments_path
    else
      render "show"
    end
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.errors.empty?
      redirect_to tournaments_path
    else
      render "new"
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :tournament_begins, :max_team, :payment, :prize)
  end

end
