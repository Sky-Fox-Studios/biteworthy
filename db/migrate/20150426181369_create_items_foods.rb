class CreateItemsFoods < ActiveRecord::Migration
  def change
    create_table :items_foods do |t|
      t.integer :food_id
      t.integer :item_id
    end
  end
end
