class AddFoodGroupsToFoods < ActiveRecord::Migration[4.2]
  def change
    add_column :foods, :food_group, :integer
  end
end
