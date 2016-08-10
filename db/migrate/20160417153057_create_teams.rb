class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string   :full_name, null: false
      t.string   :tag_name
      t.string   :country
      t.integer  :rating
      t.integer  :captain_id, null: false
      t.datetime :desired_time
      t.timestamps null: false
    end
  end
end
