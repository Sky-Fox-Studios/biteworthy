class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  :name
      t.boolean  :dairy
      t.boolean  :fruit
      t.boolean  :grain
      t.boolean  :meat
      t.boolean  :nut
      t.boolean  :sea_food
      t.boolean  :vegetable
      t.timestamps
    end
  end
end