class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
       t.integer  :user_id
       t.integer  :photo_id
       t.string   :photo_type
       t.string   :url
       t.timestamps
    end
  end
end
