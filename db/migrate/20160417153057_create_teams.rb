class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string   :full_name, null: false
      t.string   :tag_name
      t.string   :country
      t.integer  :rating
      t.integer  :captain_id, null: false
      t.integer  :specification_id
      t.timestamps null: false
    end
    add_index :teams, :tag_name,  unique: true
    add_index :teams, :full_name, unique: true
  end
end
