class CreateItemsAdditions < ActiveRecord::Migration
  def change
    create_table :items_additions do |t|
      t.integer :item_id
      t.integer :addition_id
    end
  end
end
