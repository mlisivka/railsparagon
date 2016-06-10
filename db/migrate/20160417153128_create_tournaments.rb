class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string   :title, null: false
      t.integer  :max_team, null: false
      t.integer  :payment
      t.integer  :prize
      t.integer  :team_id
      t.boolean  :end, default: false
      t.datetime :tournament_beginss, null: false
      t.timestamps null: false
    end
  end
end
