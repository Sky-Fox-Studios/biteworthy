class Food < ActiveRecord::Base
  belongs_to :restaurant

  has_many :reviews, :as => :review

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  has_many :items, through: :items_foods
  has_many :items_foods

  has_many :choices, through: :choices_foods
  has_many :choices_foods

  has_many :ingredients, through: :foods_ingredients
  has_many :foods_ingredients

  validates :restaurant_id, :name, presence: true

  validates_uniqueness_of :name, scope: :restaurant_id

  # before_create :create_ingredient
  #
  # def create_ingredient
  #   self.ingredients << Ingredient.find_or_create_by(name: self.name)
  # end
  #

end
