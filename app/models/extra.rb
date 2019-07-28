class Extra < ActiveRecord::Base
  include TrackPoints
  belongs_to :restaurant

  enum extra_type: [:addition, :choice]

  has_many :items, through: :items_extras
  has_many :items_extras
  has_many :photos, as: :photo

  has_many :prices, as: :priced

  has_many :foods, through: :extras_foods
  has_many :extras_foods

  has_many :tags, through: :extras_tags
  has_many :extras_tags

  validates :restaurant_id, :name, :extra_type, presence: true

  validates_uniqueness_of :name, scope: [:restaurant_id, :extra_type, :name]

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
