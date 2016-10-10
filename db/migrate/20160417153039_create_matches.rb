class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :match_begins
      t.string   :agora_link
      t.string   :password
      t.string   :status, default: "not happened", null: false
      t.integer  :tournament_id
      t.timestamps null: false
    end
    add_index :matches, :status
  end
end
