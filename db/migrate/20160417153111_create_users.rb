class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :played_matches
      t.integer :win
      t.integer :lose
      t.integer :kda
      t.integer :teamsId
      t.timestamps null: false
    end
  end
end
