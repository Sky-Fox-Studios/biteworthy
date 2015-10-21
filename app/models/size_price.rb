class SizePrice < ActiveRecord::Base
   belongs_to :foods, dependent: :destroy

   validates :food_id, presence: true
   validates :size, presence: true
   validates :price, presence: true

   def to_s
     "$#{price}"
   end

 end
