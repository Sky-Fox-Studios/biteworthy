class Food < ActiveRecord::Base
  belongs_to :restaurant

  has_many :reviews, as: :review
  has_many :photos, as: :photo

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  has_many :items, through: :items_foods
  has_many :items_foods

  has_many :ingredients, through: :foods_ingredients
  has_many :foods_ingredients

  has_many :varieties

  before_validation :trim_name

  validates :restaurant_id, :name, presence: true

  validates_uniqueness_of :name, scope: :restaurant_id

  enum food_group: [:dairy, :oils_fats, :meat_poultry, :fish_seafood, :vegtables, :fruits, :breads_cereals_grains, :spices, :desserts_sweets, :water]
  scope :active, -> {joins(:restaurant).where("restaurants.active = ?", true)}

  searchable do
    text    :name,         boost: 11
    text    :description
    string  :food_group
    text    :tags do
      tags.map { |tag| tag.name }
    end
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def trim_name
    self.name = self.name.strip.downcase unless self.name.nil?
  end
end
