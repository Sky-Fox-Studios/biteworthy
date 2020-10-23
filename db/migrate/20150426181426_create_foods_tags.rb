class CreateFoodsTags < ActiveRecord::Migration[4.2]
  def change
    create_table :foods_tags do |t|
      t.integer :food_id
      t.integer :tag_id
    end
  end
end
