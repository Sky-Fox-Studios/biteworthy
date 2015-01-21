class FoodItem < ActiveRecord::Base
   belongs_to :menu_group
   validates :menu_group_id, :name, :description, presence: true

end
