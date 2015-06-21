class CreateFoodsIngredients < ActiveRecord::Migration
  def change
    create_table :foods_ingredients do |t|
      t.integer  :food_id
      t.integer  :ingredient_id
      t.boolean  :local
      t.boolean  :organic
      t.boolean  :naturally_grown
      t.string   :source
      t.timestamps
    end
  end
end
