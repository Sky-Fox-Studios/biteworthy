class Menu < ActiveRecord::Base
   belongs_to :restaurant
  #  has_and_belongs_to_many :items, dependent: :destroy

  has_many :hours, :as => :hour

  has_and_belongs_to_many :menu_groups

  validates :restaurant_id, presence: true

end
