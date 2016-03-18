class ItemsChoice < ActiveRecord::Base

  belongs_to :choice
  belongs_to :item

  validates_uniqueness_of :item_id, scope: :choice_id
end