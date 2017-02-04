class InvitesController < ApplicationController

  def create
  end

  def destroy
  end

  def create
    invite = Invite.new
    invite.team = Team.find(params[:team_id])
    invite.recipient = User.find_by_name(params[:user])
    invite.sender = current_user
    respond_to do |format|
      if invite.save
        format.html { render nothing: true }
      else
        format.html { render json: { error: invite.errors } }#full_messages.to_sentence
      end
    end
  end

  def update
    invite = Invite.update(params[:id], accepted: params[:accepted])
    if params[:accepted] == "true"
      invite.team.users << current_user
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
