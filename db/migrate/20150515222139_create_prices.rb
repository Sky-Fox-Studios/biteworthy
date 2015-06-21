class CreatePrices < ActiveRecord::Migration
   def change
    create_table :prices do |t|
      t.integer :item_id
       t.float   :price
       t.string  :size
    end
  end
end
