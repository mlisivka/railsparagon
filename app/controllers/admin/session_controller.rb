class Admin::SessionController < ApplicationController
  layout except: :new

  def new
    if params[:login]
      @admin = AdminUser.where(login: params[:login]).first
      render_403 unless @admin
    end
  end

  def create
    @admin = AdminUser.find_by_login(params[:login])
    if @admin.encrypted_password.empty?
      @admin.update_attributes(password_salt: BCrypt::Engine.generate_salt)
      @admin.update_attributes(encrypted_password: BCrypt::Engine.hash_secret(params[:password], @admin.password_salt))
    end
    admin = AdminUser.authenticate(params[:login], params[:password])
    if admin
      session[:admin_id] = admin.id
      admin.update_tracked_fields(request)
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
