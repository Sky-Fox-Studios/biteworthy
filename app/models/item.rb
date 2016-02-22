class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu_group

  has_many :prices, as: :priced
  has_many :reviews, :as => :review
  has_many :photos, :as => :photo

  has_many :foods, through: :items_foods
  has_many :items_foods

  has_many :choices, through: :items_choices
  has_many :items_choices

  has_many :additions, through: :items_additions
  has_many :items_additions

  has_many :ingredients, through: :items_ingredients
  has_many :items_ingredients

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  has_many :ingredients, through: :items_ingredients
  has_many :items_ingredients

  accepts_nested_attributes_for :foods, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates :restaurant_id, :menu_group_id, :name, presence: true


end
