class ItemsTag < ApplicationRecord
  include TrackPoints

  belongs_to :tag
  belongs_to :item

  validates_uniqueness_of :item_id, scope: :tag_id

end
