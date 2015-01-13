class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.integer :menu_group_id
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
