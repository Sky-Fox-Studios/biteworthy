class CreateFavoriteRestaurant < ActiveRecord::Migration
  def change
    create_table :favorite_restaurants do |t|
       t.integer :rating, :limit =>  1
       t.integer :restaurant_id
       t.string :comment
       t.timestamps
    end
  end
end