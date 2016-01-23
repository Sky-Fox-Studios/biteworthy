class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.integer :restaurant_id
      t.string  :name
      t.string  :description
      t.timestamps
    end
  end
end