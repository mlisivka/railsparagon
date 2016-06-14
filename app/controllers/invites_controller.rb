class InvitesController < ApplicationController

  def create
  end

  def destroy
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
