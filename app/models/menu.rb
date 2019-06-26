class Menu < ActiveRecord::Base
   belongs_to :restaurant
  #  has_and_belongs_to_many :items, dependent: :destroy

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }


  has_many :hours,   as: :hour
  has_many :seasons, as: :season

  has_and_belongs_to_many :menu_groups

  validates :restaurant_id, presence: true

  accepts_nested_attributes_for :hours, allow_destroy: true

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
