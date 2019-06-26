class Restaurant < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :menu_groups, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :reviews, as: :review
  has_many :photos, as: :photo
  has_and_belongs_to_many :tags
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses

  validates :name, presence: true

  after_create -> { save_points('create') }
  after_update -> { save_points('update') }
  after_destroy -> { save_points('destroy') }

  scope :active, -> {where(active: true)}

  # searchable do
  #   text    :name
  #   text    :slogan
  #   text    :about
  #   boolean :active
  #   text    :tags do
  #     tags.map { |tag| tag.name }
  #   end
  # end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.worth(change_type)
    case(change_type)
    when "create"
      100
    when "update"
      10
    when "destroy"
      -50
    end
  end
end
