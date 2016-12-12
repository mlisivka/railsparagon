class MatchesController < ApplicationController

  before_filter :find_match, only: [:show, :desired_time]

  def index
    @matches = Match.all.includes(:teams)
  end

  def show
    render_404 unless @match
  end

  def desired_time
    @match.teams.each do |t|
      t.update(desired_time: params[:desired_time]) if t.users.include?(current_user)
      if t.errors.empty?
        redirect_to match_path(@match) and return
      else
        render match_path(@match)
      end
    end
  end

  private

  def find_match
    @match = Match.where(id: params[:id]).first
  end

end
