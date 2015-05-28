class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
       t.integer  :rating
       t.integer  :user_id
       t.integer  :favorite_id
       t.string   :favorites_type
       t.timestamps
    end
  end
end
