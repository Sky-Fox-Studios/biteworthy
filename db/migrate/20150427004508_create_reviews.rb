class CreateReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :reviews do |t|
       t.integer  :rating
       t.integer  :user_id
       t.integer  :review_id
       t.string   :review_type
       t.timestamps
    end
  end
end
