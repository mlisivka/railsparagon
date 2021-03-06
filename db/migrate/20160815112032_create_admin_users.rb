class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :login,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :password_salt,      null: false, default: ""
      t.integer :role_id

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :admin_users, :login,   unique: true
    add_index :admin_users, :role_id
  end
end
