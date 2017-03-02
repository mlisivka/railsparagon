class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def detail
    @current_team = Team.where(id: params[:team_id]).first
    @team_players = @current_team.users
    respond_to :js
  end
  
  def register_team_to_the_tournament
    @team = Team.find(params[:team_id])
    @tournament = Tournament.find(params[:id])
    add_users_to_the_tournament
    @tournament.teams << @team if @tournament.errors.messages.empty?
    respond_to :js
  end
  
  def leave_tournament
    @tournament = Tournament.find(params[:id])
    @tournament.teams.map do |team|
      if team.users.include?(current_user)
        @tournament.teams.delete team
        @tournament.users.delete team.users
      end
    end
    redirect_to @tournament
  end

  private

  def add_users_to_the_tournament
    number_of_players_for_the_game = 5
    if @team.users.size < number_of_players_for_the_game
      @tournament.errors.add(:team, _('To take part in the tournament your team must be at least 5 players'))
    else
      @tournament.users << @team.users if @team.users.include?(current_user)
    end
  end

  def tournament_params
    params.require(:tournament).permit(:title, :tournament_begins, :max_team, :payment, :prize_pool)
  end

end
