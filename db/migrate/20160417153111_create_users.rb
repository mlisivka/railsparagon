class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.integer :played_matches
      t.integer :win
      t.integer :lose
      t.integer :kda
      t.integer :team_id
      t.timestamps null: false
    end
    add_index :users, :name, unique: true
  end
end
