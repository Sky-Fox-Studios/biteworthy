class CreateMenus < ActiveRecord::Migration[4.2]
  def change
    create_table :menus do |t|
      t.integer :restaurant_id
      t.string :name, default: "Default"
      t.string :description
      t.timestamps
    end
  end
end
