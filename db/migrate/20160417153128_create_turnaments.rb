class CreateTurnaments < ActiveRecord::Migration
  def change
    create_table :turnaments do |t|
      t.string :title, null: false
      t.datetime :date_turnament, null: false
      t.integer :max_team, null: false
      t.integer :payment
      t.integer :prize
      t.integer :teamsId
      t.timestamps null: false
    end
  end
end
