class CreateItemsExtras < ActiveRecord::Migration[4.2]
  def change
    create_table :items_extras do |t|
      t.integer :item_id
      t.integer :extra_id
    end
  end
end
