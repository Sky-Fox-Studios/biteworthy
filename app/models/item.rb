class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu_group
  has_many   :prices

  has_many :reviews, :as => :review

  has_many :foods, through: :items_foods
  has_many :items_foods

  has_many :choices, through: :items_choices
  has_many :items_choices

  has_many :ingredients, through: :items_ingredients
  has_many :items_ingredients

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  has_many :ingredients, through: :items_ingredients
  has_many :items_ingredients

  validates :restaurant_id, :menu_group_id, :name, presence: true
end
