class TurnamentsController < ApplicationController

  def index
    @turnaments = Turnament.all
  end

  def show
    @teams = Team.where(captainId: current_user)
    @users = User.all
    @current_team = Team.find_by_id(params[:team_id])

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @turnament = Turnament.create(turnament_params)
    if @turnament.errors.empty?
      redirect_to turnaments_path
    else
      render "new"
    end
  end

  private

  def turnament_params
    params.require(:turnament).permit(:title, :date_turnament, :max_team, :payment, :prize)
  end

end
