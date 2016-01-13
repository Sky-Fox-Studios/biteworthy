class Review < ActiveRecord::Base
   belongs_to :user
   belongs_to :review, :polymorphic => true
#    attr_accessible :user, :favoritable
   # http://snippets.aktagon.com/snippets/588-how-to-implement-reviews-in-rails-with-polymorphic-associations
   validates :rating, presence: true
   enum rating: {possible_death: -4, revulsion: -3, terrible: -2, bad: -1, meh: 0, like: 1, delicious: 2, love: 3, heavenly: 4}

   def get_rating
    Review.ratings[self.rating]
   end

   def get_review_name
     self.review_type.constantize.find_by(self.review_id).name
   end
end
