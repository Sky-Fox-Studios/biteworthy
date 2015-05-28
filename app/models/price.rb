class Price < ActiveRecord::Base
  belongs_to :food
  
  validates :food_id, :price, presence: true
  
end