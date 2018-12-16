class Variety < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :food
end
