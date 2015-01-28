class CreateFavorites < ActiveRecord::Migration
  def change
     create_table :favorites do |t|
        t.integer :favoriteable_id
        t.string :favorite_type
        t.string :title
        t.string :comment
        t.integer :rating, :limit =>  1
        t.timestamps
    end
  end
end
