class Food < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :menu_group

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :items

  validates :restaurant_id, :name, presence: true
end
