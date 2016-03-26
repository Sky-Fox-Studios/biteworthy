class ItemsAddition < ActiveRecord::Base

  belongs_to :addition
  belongs_to :item

  validates_uniqueness_of :item_id, scope: :addition_id
end