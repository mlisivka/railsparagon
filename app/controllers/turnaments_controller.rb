class TurnamentsController < ApplicationController

  def index
    @turnaments = Turnament.all
  end

  def show
    
  end

end
