class Review < ActiveRecord::Base
   belongs_to :user
   belongs_to :review, polymorphic: true
#    attr_accessible :user, :favoritable
   # http://snippets.aktagon.com/snippets/588-how-to-implement-reviews-in-rails-with-polymorphic-associations
   validates :rating, :user, :review, presence: true
   scope :tag_reviews,  ->(user_id) { where(user_id: user_id, review_type: "Tag") }
   scope :item_reviews, ->(user_id) { where(user_id: user_id, review_type: "Item") }
   scope :restaurant_reviews, ->(user_id) { where(user_id: user_id, review_type: "Restaurant") }
   scope :order_desc,   -> { order("rating desc") }
   enum rating: {possible_death: -6, allergic: -5, vile: -4, disgust: -3, terrible: -2, dislike: -1,
                 "-".to_sym => 0,
                 like: 1, enjoy: 2, great: 3, delicious: 3, love: 4, heavenly: 5}

   def get_rating
    Review.ratings[self.rating]
   end

   def self.review_types
     ["Restaurant", "Item", "Food", "Tag"]
     # "Ingredient"
   end

   def to_param
     "#{id}-#{review.class.to_s}-#{review.id}"
   end

   def get_review_name
     self.review_type.constantize.find_by(self.review_id).name
   end
end
