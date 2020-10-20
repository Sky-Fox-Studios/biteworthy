class CreatePrices < ActiveRecord::Migration[4.2]
   def change
    create_table :prices do |t|
      t.integer  :priced_id
      t.string   :priced_type
       t.float   :value
       t.string  :size
    end
  end
end
