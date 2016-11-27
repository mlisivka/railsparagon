class Admin::SessionController < ApplicationController
  layout except: :new

  def new
    @admin = AdminUser.where(login: params[:login]).first
    render_403 unless @admin
  end

  def create
    save_password_if_admin_new
    @admin = AdminUser.authenticate(params[:login], params[:password])
    if @admin
      admin_was_autheticate
      redirect_to admin_root_path
    else
      render :new
    end
  end
  
  def save_password_if_admin_new
    @admin = AdminUser.where(login: params[:login]).first
    unless @admin.encrypted_password?
      password_salt = BCrypt::Engine.generate_salt
      @admin.update_attributes(encrypted_password: BCrypt::Engine.hash_secret(params[:password], password_salt),
                              password_salt: password_salt)
    end
  end
  
  def admin_was_autheticate
    session[:admin_id] = @admin.id
    @admin.update_tracked_fields(request)
  end

  def destroy
    session.delete(:admin_id)
    redirect_to root_path
  end

end
