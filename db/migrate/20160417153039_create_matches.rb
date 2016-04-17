class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date_match, null: false
      t.integer :teamId_1, null: false
      t.integer :teamId_2, null: false
      t.string :agora_link, null: false
      t.timestamps null: false
    end
  end
end
