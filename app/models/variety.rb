class Variety < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :food
  validates_uniqueness_of :name, scope: [:food_id, :ingredient_id]
end
