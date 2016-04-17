class CreateTurnaments < ActiveRecord::Migration
  def change
    create_table :turnaments do |t|

      t.timestamps null: false
    end
  end
end
