class MakeExtraPolymorphic < ActiveRecord::Migration
  def change
    drop_table :extras_foods
    remove_column :extras, :name, :string
    remove_column :extras, :description, :string
    rename_column :extras, :addon_type, :addon_type
    add_column :extras, :extrable_id, :integer, after: :restaurant_id
    add_column :extras, :extrable_type, :string, after: :extrable_id
  end
end
