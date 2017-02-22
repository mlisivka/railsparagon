class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string   :full_name, null: false
      t.string   :tag_name
      t.timestamps null: false
    end
    add_index :teams, :full_name, unique: true
  end
end
