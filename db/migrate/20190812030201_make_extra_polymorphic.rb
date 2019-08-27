class MakeExtraPolymorphic < ActiveRecord::Migration
  def change
    drop_table :extras_foods do |ef|
      ef.integer :extra_id
      ef.integer :food_id
    end
    drop_table :items_extras do |ie|
      ie.integer :item_id
      ie.integer :extra_id
    end

    remove_column :extras, :name, :string
    remove_column :extras, :description, :string
    rename_column :extras, :extra_type, :addon_type
    add_column :extras, :extrable_id, :integer, after: :restaurant_id
    add_column :extras, :extrable_type, :string, after: :extrable_id
  end
end
