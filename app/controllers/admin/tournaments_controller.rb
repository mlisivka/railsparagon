class Admin::TournamentsController < AdminController
  
  def show
    super column_without: ['team_id']
  end
  
  def new
    super column_without: ['team_id', 'end']
  end
  
  def edit
    super column_without: ['team_id', 'end']
  end
  
end
