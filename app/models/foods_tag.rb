class FoodsTag < ActiveRecord::Base
  
  belongs_to :food
  belongs_to :tag
  
  validates_uniqueness_of :food_id, scope: :tag_id

end