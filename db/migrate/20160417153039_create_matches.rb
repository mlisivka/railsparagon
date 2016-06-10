class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :match_begins, null: false
      t.integer  :team_id, null: false
      t.string   :agora_link, null: false
      t.boolean  :end, default: false
      t.timestamps null: false
    end
  end
end
