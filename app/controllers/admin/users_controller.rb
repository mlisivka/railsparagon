class Admin::UsersController < AdminController
  
  def index
    @users = User.all
    @config_column_name = [:id,:name,:played_matches,:team_id,:created_at]
  end
  
end
