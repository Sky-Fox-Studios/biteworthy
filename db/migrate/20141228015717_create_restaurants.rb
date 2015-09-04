class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :slogan
      t.string :about
      t.string :address_id
      t.string :phone_number
      t.string :disclaimer
      t.integer :seating
      t.integer :outside_seating
      t.timestamps
    end
  end
end
