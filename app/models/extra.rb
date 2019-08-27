class Extra < ActiveRecord::Base
  include TrackPoints
  attr_accessor :extrable_item, :extrable_food
  belongs_to :restaurant
  belongs_to :extrable, polymorphic: true

  enum addon_type: [:addition, :choice]

  has_many :photos, as: :photo

  has_many :prices, as: :priced

  has_many :tags, through: :extras_tags
  has_many :extras_tags

  validates :restaurant_id, :extrable_id, :extrable_type, :addon_type, presence: true

  # TODO think more here
  # validates_uniqueness_of :name, scope: [:restaurant_id, :addon_type]

  def to_param
    "#{id}-#{extrable.name.parameterize}"
  end
end
