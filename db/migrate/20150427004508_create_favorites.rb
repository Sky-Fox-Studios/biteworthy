class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
       t.string   :title
       t.string   :description
       t.integer  :rating
       t.integer  :user_id
       t.integer  :favorite_id
       t.string   :favorite_type
       t.timestamps
    end
  end
end
