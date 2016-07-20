class AdminController < ApplicationController
  layout "admin"
  
  def index(options={}, &block)
    @value = controller_name.classify.constantize.all
    @column = options[:column] || all_columns
  end
  
  def show(options={}, &block)
    p options[:column_without]
    @value = controller_name.classify.constantize.find(params[:id])
    if options[:column_without]
      @column = all_columns - options[:column_without]
    else
      @column = options[:column] || all_columns
    end
  end
  
  def new(options={}, &block)
    if options[:column_without]
      @column = all_columns - ["id", "created_at", "updated_at"] - options[:column_without]
    else
      @column = all_columns - ["id", "created_at", "updated_at"]
    end
  end
  
  private
  
  def all_columns
    controller_name.classify.constantize.column_names
  end
  
end
