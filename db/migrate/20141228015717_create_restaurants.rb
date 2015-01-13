class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :slogan
      t.string :food_groups
      t.integer :latitude, :limit =>  12
      t.integer :longitude, :limit => 12
      t.timestamps
    end
  end
end
