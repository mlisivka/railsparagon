class Admin::UsersController < AdminController
  
  def column
    ['id', 'name', 'created_at']
  end
  
end
