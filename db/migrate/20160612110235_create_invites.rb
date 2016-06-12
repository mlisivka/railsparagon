class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :team_id,      null: false
      t.integer :sender_id,    null: false
      t.integer :recipient_id, null: false
      t.boolean :accepted
      t.timestamps null: false
    end
  end
end
