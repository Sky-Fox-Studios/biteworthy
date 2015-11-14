class Food < ActiveRecord::Base
  belongs_to :restaurant
  
  has_many :reviews, :as => :review

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  has_many :items, through: :items_foods
  has_many :items_foods

  has_many :ingredients, through: :foods_ingredients
  has_many :foods_ingredients

  validates :restaurant_id, :name, presence: true

end
