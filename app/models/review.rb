class Review < ActiveRecord::Base
   belongs_to :user
   belongs_to :review, polymorphic: true
#    attr_accessible :user, :favoritable
   # http://snippets.aktagon.com/snippets/588-how-to-implement-reviews-in-rails-with-polymorphic-associations
   validates :rating, :user, :review, presence: true
   enum rating: {possible_death: -5, allergic: -4, disgust: -3, terrible: -2, dislike: -1, "-".to_sym => 0, like: 1, enjoy: 2, delicious: 3, love: 4, heavenly: 5}

   def get_rating
    Review.ratings[self.rating]
   end

   def to_param
     "#{id}-#{user.user_name}"
   end

   def get_review_name
     self.review_type.constantize.find_by(self.review_id).name
   end
end
