class MatchesController < ApplicationController

  def index
    @matches = Match.all.eager_load(:teams)
  end

  def show
    @match = Match.where(id: params[:id]).first
    @match.teams.each{ |t| puts true if t.users.include? current_user }
    render_404 unless @match
  end

end
