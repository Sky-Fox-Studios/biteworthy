class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
       t.string :name
       t.string :slogan
       t.string :about
       t.string :address
       t.string :phone_number
       t.string :disclaimer
       t.float  :latitude,  :limit => 12
       t.float  :longitude, :limit => 12
       t.timestamps
    end
  end
end
