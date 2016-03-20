class Restaurant < ActiveRecord::Base
  has_many :menus, dependent: :destroy
  has_many :menu_groups, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :choices, dependent: :destroy
  has_many :reviews, :as => :review
  has_many :photos, :as => :photo
  has_and_belongs_to_many :tags
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:street].blank? }, :allow_destroy => true

  validates :name, presence: true

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
