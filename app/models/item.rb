class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu_group
  has_many   :prices

  has_many :favorites, :as => :favorite

  has_many :foods, through: :items_foods
  has_many :items_foods

  has_many :tags, through: :foods_tags
  has_many :foods_tags

  validates :restaurant_id, :menu_group_id, :name, presence: true
end
