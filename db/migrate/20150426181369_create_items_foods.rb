class CreateItemsFoods < ActiveRecord::Migration
  def change
    create_table :items_foods do |t|
      t.integer :restaurant_id
      t.integer :item_id
      t.integer :food_id
    end
  end
end
