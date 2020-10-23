class RemoveFoodIdFromVarieties < ActiveRecord::Migration[4.2]
  def change
    remove_column :varieties, :food_id, :integer
  end
end
