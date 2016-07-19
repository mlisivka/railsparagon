class Admin::UsersController < AdminController
  
  def index
    super column: ['id', 'name', 'created_at']
  end
  
  private
  
  #@column = ['id', 'name', 'created_at']
  
  #def column
    #['id', 'name', 'created_at']
    #end
  
end
