class CreateChoicesFoods < ActiveRecord::Migration
  def change
    create_table :choices_foods do |t|
       t.integer :choice_id
       t.integer :food_id
    end
  end
end
