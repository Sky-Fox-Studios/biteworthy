class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
       t.integer  :rating
       t.integer  :user_id
       t.integer  :star_id
       t.string   :star_type
       t.timestamps
    end
  end
end
