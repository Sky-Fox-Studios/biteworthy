class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
       t.string :name
       t.string :slogan
       t.string :address
       t.string :phone_number
       t.float  :latitude,  :limit => 12
       t.float  :longitude, :limit => 12
       t.timestamps
    end
  end
end