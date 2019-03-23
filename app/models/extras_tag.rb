class ExtrasTag < ActiveRecord::Base

  belongs_to :extra
  belongs_to :tag

  validates_uniqueness_of :tag_id, scope: :extra_id
end
