class AddParentIdToIngredient < ActiveRecord::Migration[4.2]
  def change
    add_column :ingredients, :parent_id, :integer, after: :user_id
  end
end
