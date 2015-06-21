class CreatePricesSizes < ActiveRecord::Migration
   def change
     create_table :prices_sizes do |t|
       t.integer :item_id
       t.string  :size
       t.float  :price
    end
  end
end
