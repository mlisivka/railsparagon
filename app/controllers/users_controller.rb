class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @teams = Team.where(captain_id: current_user)
  end
  
  def send_invite
    recipient = User.find(params[:id])
    team = Team.find(params[:team_id])
    invite = Invite.new(sender_id: current_user.id, recipient_id: params[:id], team_id: params[:team_id])
    if invite.save
    end
    respond_to do |format|
      format.html { render :nothing => true }
    end
  end

end
