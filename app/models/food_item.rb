class FoodItem < ActiveRecord::Base
   belongs_to :menu_group
   has_many :favorites, as: :favoriteable

   
   
   
   validates :menu_group_id, :name, :description, presence: true

end
