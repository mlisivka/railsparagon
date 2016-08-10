class MatchesController < ApplicationController

  def index
    @matches = Match.all.eager_load(:teams)
  end

  def show
    @match = Match.where(id: params[:id]).first
  end

end
