class AddTitleAndCommentToReview < ActiveRecord::Migration[4.2]
  def change
    add_column :reviews, :title, :string, after: :review_type
    add_column :reviews, :description, :text, after: :title
  end
end
