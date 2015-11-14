class Ingredient < ActiveRecord::Base

  validates :name, presence: true

  has_many :foods, through: :foods_ingredients
  has_many :foods_ingredients

end
