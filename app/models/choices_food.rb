class ChoicesFood < ActiveRecord::Base

  belongs_to :choice
  belongs_to :food

  validates_uniqueness_of :food_id, scope: :choice_id
end