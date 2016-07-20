class Admin::UsersController < AdminController
  
  def index
    super column: ['id', 'name', 'created_at']
  end
  
  def show
    super column_without: ['team_id']
  end
  
end
