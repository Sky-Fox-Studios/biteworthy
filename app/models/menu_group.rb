class MenuGroup < ActiveRecord::Base
   belongs_to :restaurant
   has_many :foods, dependent: :destroy
   has_many :tags

   
end
