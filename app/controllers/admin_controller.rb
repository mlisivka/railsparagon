class AdminController < ApplicationController
  layout "admin"
  
  def index
    @controller_data = controller_name.classify.constantize.all
    @column = column
  end
  
  def new
    @column = column - ["id", "created_at", "updated_at"]
  end
  
  private
  
  def all_columns
    controller_name.classify.constantize.column_names
  end
  
  def column(column = all_columns)
    column
  end
  
end
