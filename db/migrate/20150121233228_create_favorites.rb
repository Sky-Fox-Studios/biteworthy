class CreateFavorites < ActiveRecord::Migration
  def change
     create_table :favorites do |t|
        t.integer :user_id
        t.integer :favoritable_id
        t.string  :favoritable_type
        t.string :title
        t.string :comment
        t.integer :rating, :limit =>  1
        t.timestamps
    end
  end
end
