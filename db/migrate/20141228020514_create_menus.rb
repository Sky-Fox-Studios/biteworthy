class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaurant_id
      t.string :name, default: "Default"
      t.string :description
      t.string :background_color
      t.string :text_color
      t.timestamps
    end
  end
end
