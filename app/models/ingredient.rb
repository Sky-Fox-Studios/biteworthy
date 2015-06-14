class Ingredient < ActiveRecord::Base
  
    validates :name, :description, presence: true
end