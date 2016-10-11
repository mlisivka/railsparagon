class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id
      t.integer :tournament_id
      t.integer :players_id
      t.timestamps null: false
    end
  end
end
