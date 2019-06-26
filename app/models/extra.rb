class Extra < ActiveRecord::Base
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
  validates_uniqueness_of :name, scope: [:restaurant_id, :extra_type]

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.worth(change_type)
    case(change_type)
    when "create"
      5
    when "update"
      1
    when "destroy"
      -5
    end
  end
end
