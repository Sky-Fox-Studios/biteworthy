class Choice < ActiveRecord::Base
  belongs_to :restaurant

  has_many :items, through: :items_choices
  has_many :items_choices

  has_many :foods, through: :choices_foods
  has_many :choices_foods

  validates :restaurant_id, :name, presence: true

  validates_uniqueness_of :name, scope: :restaurant_id

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
