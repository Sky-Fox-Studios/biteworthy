class Item < ActiveRecord::Base
  belongs_to :restaurant

  has_many :prices, as: :priced
  has_many :reviews, :as => :review
  has_many :photos, :as => :photo

  has_and_belongs_to_many :menu_groups

  has_many :foods, through: :items_foods
  has_many :items_foods

  has_many :extras, through: :items_extras
  has_many :items_extras

  has_many :ingredients, through: :items_ingredients
  has_many :items_ingredients

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  has_many :ingredients, through: :items_ingredients
  has_many :items_ingredients

  accepts_nested_attributes_for :foods, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates :restaurant_id, :name, presence: true

  validates_uniqueness_of :name, scope: [:restaurant_id, :description]

  searchable do
    text    :name,         boost: 11
    text    :description
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
