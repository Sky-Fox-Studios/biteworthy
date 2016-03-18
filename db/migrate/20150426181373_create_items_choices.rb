class CreateItemsChoices < ActiveRecord::Migration
  def change
    create_table :items_choices do |t|
      t.integer :item_id
      t.integer :choice_id
    end
  end
end
