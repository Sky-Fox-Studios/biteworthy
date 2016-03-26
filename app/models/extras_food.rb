class ExtrasFood < ActiveRecord::Base

  belongs_to :extra
  belongs_to :food

  validates_uniqueness_of :food_id, scope: :extra_id
end