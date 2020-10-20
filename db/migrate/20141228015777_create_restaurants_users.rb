class CreateRestaurantsUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :restaurants_users do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.integer :role_id
    end
  end
end
