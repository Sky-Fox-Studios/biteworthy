class Favorite < ActiveRecord::Base
   belongs_to :user
   belongs_to :favorite, :polymorphic => true
#    attr_accessible :user, :favoritable
   # http://snippets.aktagon.com/snippets/588-how-to-implement-favorites-in-rails-with-polymorphic-associations
end