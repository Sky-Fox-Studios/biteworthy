class CreatePrices < ActiveRecord::Migration
   def change
    create_table :prices do |t|
       t.integer :food_id
       t.float   :price
       t.string  :size
    end
  end
end
