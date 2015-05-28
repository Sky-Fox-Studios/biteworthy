class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :menu_group_id
      t.integer :restaurant_id
      t.string  :name
      t.string  :description
      t.timestamps
    end
  end
end