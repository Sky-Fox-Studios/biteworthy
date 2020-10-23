class AddItemTags < ActiveRecord::Migration[4.2]
  def change
    create_table :items_tags do |t|
      t.integer :item_id
      t.integer :tag_id
    end
  end
end
