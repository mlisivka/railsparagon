class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :country
      t.integer :rating
      t.string :image
      t.integer :captainId, null: false
      t.integer :playersId
      t.timestamps null: false
    end
  end
end
