class AdditionsFood < ActiveRecord::Base

  belongs_to :addition
  belongs_to :food

  validates_uniqueness_of :food_id, scope: :addition_id
end