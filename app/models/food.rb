class Food < ActiveRecord::Base
   belongs_to :restaurant
   belongs_to :menu_group
   has_many :favorites, :as => :favoritable
   has_and_belongs_to_many :tags
   validates :menu_group_id, :name, :description, presence: true
end
