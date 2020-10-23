class CreateIngredientsTags < ActiveRecord::Migration[4.2]
  def change
    create_table :ingredients_tags do |t|
       t.integer :ingredient_id
       t.integer :tag_id
    end
  end
end
