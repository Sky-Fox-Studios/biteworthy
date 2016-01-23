class CreateAdditionsFoods < ActiveRecord::Migration
  def change
    create_table :additions_foods do |t|
       t.integer :addition_id
       t.integer :food_id
    end
  end
end
