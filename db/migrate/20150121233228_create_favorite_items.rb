class CreateFavoriteItems < ActiveRecord::Migration
  def change
     create_table :favorites_items do |t|
      t.integer :rating, :limit =>  1
      t.integer :item_id
      t.string :comment
      t.timestamps
    end
  end
end
