class Variety < ActiveRecord::Base
  before_validation :set_normalized_name
  belongs_to :ingredient
  has_many :foods, through: :foods_varieties
  has_many :foods_varieties
  validates_uniqueness_of :name, scope: [:ingredient_id]

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }

  def set_normalized_name
    self.name = self.name.parameterize.singularize
  end

  def display_name
    ingredient_first ? "#{ingredient.name} #{name}" : "#{name} #{ingredient.name}"
  end

  def self.worth(change_type)
    case(change_type)
    when "create"
      3
    when "update"
      1
    when "destroy"
      -3
    end
  end
end
