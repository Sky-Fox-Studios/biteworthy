class CreateFoodsItems < ActiveRecord::Migration
  def change
    create_table :foods_items do |t|
      t.integer :food_id
      t.integer :item_id
    end
  end
end
