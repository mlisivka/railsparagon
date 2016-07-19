class AdminController < ApplicationController
  layout "admin"
  
  def index(options={}, &block)
    @controller_data = controller_name.classify.constantize.all
    @column = options[:column] || all_columns
  end
  
  def new
    @column = column - ["id", "created_at", "updated_at"]
  end
  
  private
  
  def all_columns
    controller_name.classify.constantize.column_names
  end
  
end
