class Review < ActiveRecord::Base
   belongs_to :user
   belongs_to :review, :polymorphic => true
#    attr_accessible :user, :favoritable
   # http://snippets.aktagon.com/snippets/588-how-to-implement-reviews-in-rails-with-polymorphic-associations
   validates :rating, presence: true
   enum rating: {Worst: -3, Terrible: -2, Bad: -1, Unrated: 0, OK: 1, Decent: 2, Great: 3}

   def get_rating
    Review.ratings[self.rating]
   end

   def get_review_name
     self.review_type.constantize.find_by(self.review_id).name
   end
end
