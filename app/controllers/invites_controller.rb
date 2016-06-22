class InvitesController < ApplicationController

  def create
  end

  def destroy
  end
  
  def create
    invite = Invite.new
    #recipient = User.find(params[:user_id])
    #team = Team.find(params[:team_id])
    invite.team = Team.find(params[:team_id])
    invite.recipient = User.find(params[:user_id])
    invite.sender = current_user
    invite.save
    #invite = Invite.new(sender_id: current_user.id, recipient_id: params[:user_id], team_id: params[:team_id]) #unless invite.team.include?(team1) && invite.recipient.include?(recipient) && invite.sended.include?(current_user.id)
    if invite.save
    end
    respond_to do |format|
      format.html { render :nothing => true }
    end
  end

  def update
    @invite = Invite.find_by_id(params[:id])
    @invite.update(accepted: params[:accepted])
    if params[:accepted] == "true"
      current_user.teams << @invite.team
    end
    respond_to do |format|
      format.html { render :nothing => true }
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:team_id, :sender_id, :recipient_id, :accepted)
  end

end
