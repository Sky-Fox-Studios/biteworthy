class Food < ActiveRecord::Base
  belongs_to :restaurant

  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :items

  validates :restaurant_id, :name, presence: true
end
