class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :match_begins
      t.string   :agora_link
      t.string   :status, default: "not happened", null: false
      t.timestamps null: false
    end
  end
end
