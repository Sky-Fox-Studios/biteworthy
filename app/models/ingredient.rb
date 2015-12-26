class Ingredient < ActiveRecord::Base
  before_validation :set_tag_name

  validates :name, presence: true
  validates :tag_name, presence: true

  has_many :items, through: :items_ingredients
  has_many :items_ingredients

  has_many :foods, through: :foods_ingredients
  has_many :foods_ingredients

  has_many :tags, through: :ingredients_tags
  has_many :ingredients_tags

  # validates_uniqueness_of :tag_name
  validates :tag_name, uniqueness: true

  def set_tag_name
    self.tag_name = Tag.normalize(self.name)
  end
end
