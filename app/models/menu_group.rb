class MenuGroup < ActiveRecord::Base
   belongs_to :restaurant
  has_many :items, dependent: :destroy
   has_and_belongs_to_many :tags

   
end
