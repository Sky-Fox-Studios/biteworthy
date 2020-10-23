class FoodsIngredient < ApplicationRecord
  include TrackPoints

  belongs_to :food
  belongs_to :ingredient

  validates_uniqueness_of :food_id, scope: :ingredient_id

end
