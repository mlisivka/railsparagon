class Admin::SessionController < ApplicationController
  layout except: :new

  def new
    if params[:login]
      @admin = AdminUser.where(login: params[:login]).first
      render_403 unless @admin
    end
  end

  def create
    admin = AdminUser.authenticate(params[:login], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to root_path
  end

end
