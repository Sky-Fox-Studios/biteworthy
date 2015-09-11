class Restaurant < ActiveRecord::Base
  has_many :menu_groups, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :reviews, :as => :favoritable
  has_and_belongs_to_many :tags
  has_many :addresses
  accepts_nested_attributes_for :addresses
  validates :name, presence: true
end
