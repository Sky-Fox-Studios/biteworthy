class Ingredient < ActiveRecord::Base
  before_validation :set_normalized_name
  belongs_to :user

  has_many :photos, as: :photo

  has_many :items, through: :items_ingredients
  has_many :items_ingredients

  has_many :foods, through: :foods_ingredients
  has_many :foods_ingredients

  has_many :tags, through: :ingredients_tags
  has_many :ingredients_tags

  has_many :varieties, dependent: :destroy

  validates :name, :normalized_name, presence: true
  validates :normalized_name, uniqueness: true
  has_many :reviews, as: :review
  attr_accessor :variety

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }

  scope :ingredients_created, ->(user) { where(user: user).count }

  def to_param
    "#{id}-#{normalized_name}"
  end

  def set_normalized_name
    self.normalized_name = self.name.parameterize.singularize
  end

  def get_review(user)
    reviews.where(user: user).first
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
