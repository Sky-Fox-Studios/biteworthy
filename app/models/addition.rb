class Addition < ActiveRecord::Base
  belongs_to :restaurant

  has_many :items, through: :items_additions
  has_many :items_additions

  has_many :prices, as: :priced

  has_many :foods, through: :additions_foods
  has_many :additions_foods

  validates :restaurant_id, :name, presence: true

  validates_uniqueness_of :name, scope: :restaurant_id
  
  def to_param
    "#{id}-#{name.parameterize}"
  end

end
