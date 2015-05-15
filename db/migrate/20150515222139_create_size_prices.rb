class CreateSizePrices < ActiveRecord::Migration
   def change
    create_table :size_prices do |t|
       t.integer :food_id
       t.string  :size
       t.float  :price
    end
  end
end
