class AdminUser < ActiveRecord::Base

  before_save :encrypt_password

  def self.authenticate(login, password)
    admin = find_by_login(login)
    if admin && admin.encrypted_password == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
