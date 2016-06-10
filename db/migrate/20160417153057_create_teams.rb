class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :full_name, null: false
      t.string  :tag_name
      t.string  :country
      t.integer :rating
      t.string  :image
      t.integer :captain_id, null: false
      t.timestamps null: false
    end
  end
end
