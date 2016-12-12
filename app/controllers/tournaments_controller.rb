class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.where(id: params[:id]).first
  end

  def detail
    @current_team = Team.where(id: params[:team_id]).first
    @team_players = @current_team.users
    respond_to :js
  end
  
  def register_team_to_the_tournament
    @team = Team.find(params[:team_id])
    @tournament = Tournament.find(params[:id])
    add_players_to_the_tournament
    respond_to :js
  end

  private

  def add_players_to_the_tournament
    number_of_players_for_the_game = 5
    @registration_players = Player.new
    if params[:players].length < number_of_players_for_the_game
      @registration_players.errors.add(:team, _('To take part in the tournament your team must be at least 5 players'))
    else
      registration_players_to_the_tournament
    end
  end
  
  def registration_players_to_the_tournament
    params[:players].each do |player|
      if @team.users.include?(current_user)
        @registration_players = Player.create(team_id: params[:team_id], tournament_id: params[:id], players_id: player) 
        break if @registration_players.errors.messages.empty?
      end
    end
  end

  def tournament_params
    params.require(:tournament).permit(:title, :tournament_begins, :max_team, :payment, :prize)
  end

end
