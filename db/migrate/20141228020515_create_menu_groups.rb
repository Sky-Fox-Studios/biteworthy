class CreateMenuGroups < ActiveRecord::Migration
  def change
    create_table :menu_groups do |t|
      t.integer :restaurant_id
      t.integer :menu_order
      t.string :name
      t.string :description
      t.string :background_color
      t.string :text_color
      t.boolean :is_food_group

      t.timestamps
    end
  end
end
