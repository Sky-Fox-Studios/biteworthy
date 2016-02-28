class Ingredient < ActiveRecord::Base
  before_validation :set_normalized_name

  has_many :photos, :as => :photo

  has_many :items, through: :items_ingredients
  has_many :items_ingredients

  has_many :foods, through: :foods_ingredients
  has_many :foods_ingredients

  has_many :tags, through: :ingredients_tags
  has_many :ingredients_tags

  validates :name, :normalized_name, presence: true
  validates :normalized_name, uniqueness: true

  def set_normalized_name
    self.normalized_name = Tag.normalize(self.name)
  end
end
