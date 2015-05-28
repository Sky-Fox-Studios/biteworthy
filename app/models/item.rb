class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu_group
  has_many :prices

  has_many :favorites, :as => :favoritable
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :foods

  validates :restaurant_id, :name, :description, presence: true
end
