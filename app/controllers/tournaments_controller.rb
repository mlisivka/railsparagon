class TournamentsController < ApplicationController

  extend Bracket

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.where(id: params[:id]).first
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
    @tournament.teams << @team if @team.users.include?(current_user)
    #if @tournament.teams.length == 8
    #  generate_matches(@tournament.teams)
    #end
    respond_to :js
  end

  def detail
    @current_team = Team.where(id: params[:team_id]).first

    respond_to :js
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :tournament_begins, :max_team, :payment, :prize)
  end

  def generate_matches(teams)
    matches = Array.new(teams.length - 1)
    for j in 0..matches.count - 1
    	matches[j] = Match.new
    end
    generate_bracket(matches)
  end

  def generate_bracket(matches)
    i = matches.length - 1
    puts matches[6]
    while i >= 0
    	if Math.log2(i+2)%1 == 0
    		n = (Math.log2(i+2)*Math.log2(i+2)).to_i/2
    	end
    	if i%2 == 0 && i != 0
    		matches[i].agora_link = matches[i-n]
    		matches[i-1].agora_link = matches[i-n]
    		n -= 1
    	end
      puts i
      puts "Mathches: #{matches[i]} \n links: #{matches[i].agora_link} \n"
    	i -= 1
    end
  end

end
