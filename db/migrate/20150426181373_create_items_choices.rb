class CreateItemsChoices < ActiveRecord::Migration
  def change
    create_table :items_choices do |t|
      t.integer :item_id
      t.integer :food_id
      t.integer :group
    end
  end
end
