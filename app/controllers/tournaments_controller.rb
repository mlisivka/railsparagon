class TournamentsController < ApplicationController

  extend Bracket

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
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
    @tournament.teams << @team
    #if @tournament.teams.length == 8
    #  generate_matches(@tournament.teams)
    #end
    respond_to do |format|
        format.js {}
    end
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
