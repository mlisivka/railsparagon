class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string   :title, null: false
      t.integer  :max_team, null: false
      t.integer  :payment
      t.integer  :prize_pool
      t.integer  :team_id
      t.integer  :match_id
      t.integer  :user_id
      t.text     :description, default: '', null: false
      t.boolean  :end, default: false
      t.datetime :tournament_begins, null: false
      t.timestamps null: false
    end
    add_index :tournaments, :max_team
    add_index :tournaments, :payment
    add_index :tournaments, :prize_pool
  end
end
