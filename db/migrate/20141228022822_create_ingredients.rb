class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  :name
      t.string  :parent_id
      t.boolean  :is_sub_type, default: false
      t.boolean  :dairy, default: false
      t.boolean  :fruit, default: false
      t.boolean  :grain, default: false
      t.boolean  :meat, default: false
      t.boolean  :nut, default: false
      t.boolean  :sea_food, default: false
      t.boolean  :vegetable, default: false
      t.timestamps
    end
  end
end
