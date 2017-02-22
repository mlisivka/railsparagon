class TeamsController < ApplicationController

  def index
    @teams = Team.all.includes(:users)
  end

  def show
    log_in(User.find(2))
    @teams = current_user.teams # error current_user = nil
    @team = Team.find(params[:id])
  end

  def remove_user_from_team
    team = Team.find(params[:id])
    user = User.find(params[:user_id])
    team.users.delete(user) if team.users.first == current_user
    redirect_to team_path(team)
  end
  
  def leave_team
    team = Team.find(params[:id])
    team.users.delete(current_user) if team.users.include?(current_user)
    redirect_to team_path(team)
  end

  def create
    @team = Team.new(team_params)
    @team.users << current_user
    names = find_names(params[:friends].reject(&:empty?))
    nil_names = select_nil_name(names)
    if @team.save
      send_ivitions(names)
      redirect_to teams_path
    else
      render "new"
      puts @team.errors.messages
    end
  end

  private
  
  # Checks whether the name exists
  def find_names(names)
    query = names.to_query('displayName').delete('%5B%5D') # delete '[]'
    uri = URI.parse("https://developer-paragon.epicgames.com/v1/accounts/find?#{query}")
    request = Net::HTTP::Get.new(uri)
    request.add_field("X-Epic-ApiKey", ENV["API_KEY"])
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(request)
    return JSON.parse response.body
  end
  
  def select_nil_name(names)
    not_existing = Array.new
    if names.has_value?(nil)
      names.each {|name, accountId| not_existing << name if accountId.nil? }
    end
    return not_existing
  end
  
  def send_ivitions(names)
    names.each do |name, accountId|
      user = User.find_or_create_by(name: name, accountId: accountId)
      invite = Invite.new
      invite.team = @team
      invite.recipient = user
      invite.sender = current_user
      invite.save
    end
  end

  def team_params
    params.require(:team).permit(:full_name, :tag_name, :image)
  end

end
