class AdminController < ApplicationController
  layout "admin"
  before_filter :check_if_admin
  
  def index(options={}, &block)
    @value = controller.all
    @column = options[:column] || all_columns
  end
  
  def show(options={}, &block)
    p options[:column_without]
    @record = controller.where(params[:id]).first
    if options[:column_without]
      @column = all_columns - options[:column_without]
    else
      @column = options[:column] || all_columns
    end
  end
  
  def new(options={}, &block)
    @record = controller.new
    if options[:column_without]
      @column = all_columns - ["id", "created_at", "updated_at"] - options[:column_without]
    else
      @column = all_columns - ["id", "created_at", "updated_at"]
    end
  end
  
  def edit(options={}, &block)
    @record = controller.where(id: params[:id]).first
    if options[:column_without]
      @column = all_columns - ["id", "created_at", "updated_at"] - options[:column_without]
    else
      @column = all_columns - ["id", "created_at", "updated_at"]
    end
  end
  
  private
  
  def all_columns
    controller.column_names
  end
  
  def check_if_admin
    render_403 unless params[:admin]
  end
  
  def controller
    controller_name.classify.constantize
  end
  
end
