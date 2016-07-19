class AdminController < ApplicationController
  layout "admin"
  helper_method :column
  
  def index
    @controller_data = controller_name.classify.constantize.all
  end
  
  private
  
  def names_of_columns
    controller_name.classify.constantize.column_names
  end
  
  def column(column = names_of_columns)
    column
  end
  
end
