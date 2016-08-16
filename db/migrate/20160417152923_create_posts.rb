class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title, null: false
      t.text    :content, null: false
      t.attachment :image
      t.integer :author_id, null: false
      t.timestamps null: false
    end
  end
end
