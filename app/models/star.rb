class Star < ActiveRecord::Base
   belongs_to :user
   belongs_to :star, :polymorphic => true
#    attr_accessible :user, :favoritable
   # http://snippets.aktagon.com/snippets/588-how-to-implement-stars-in-rails-with-polymorphic-associations
   validates :rating, presence: true
   enum rating: {Worst: -3, Terrible: -2, Bad: -1, Unrated: 0, OK: 1, Better: 2, Best: 3}

   def get_rating
    Star.ratings[self.rating]
   end
end
