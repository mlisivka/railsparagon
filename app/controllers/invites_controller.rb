class InvitesController < ApplicationController

  def create
  end

  def destroy
  end
  
  def create
    invite = Invite.new
    team = Team.find(params[:team_id])
    recipient = User.find(params[:user_id])
    team.invites.each do |i|
      if i.recipient == recipient
        if i.accepted == true
          invite.errors.add(:user, "This user is already a member of this team") # Цей користувач вже є учасником цієї команди
        elsif i.accepted.nil?
          invite.errors.add(:user, "This user has already received an invitation to this team") #Цей користувач вже отримав запрошення в цю команду
        end
      end
    end
    invite.team = team
    invite.recipient = recipient
    invite.sender = current_user
    #invite = Invite.new(sender_id: current_user.id, recipient_id: params[:user_id], team_id: params[:team_id]) #unless invite.team.include?(team1) && invite.recipient.include?(recipient) && invite.sended.include?(current_user.id)
    respond_to do |format|
      if invite.errors.blank?
        invite.save unless invite.recipient == invite.sender
        format.html { render nothing: true }
      else
        format.html { render json: { error: invite.errors } }
      end
    end
  end

  def update
    @invite = Invite.find_by_id(params[:id])
    @invite.update(accepted: params[:accepted])
    if params[:accepted] == "true"
      current_user.teams << @invite.team
    end
    respond_to do |format|
      format.html { render nothing: true }
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:team_id, :sender_id, :recipient_id, :accepted)
  end

end
