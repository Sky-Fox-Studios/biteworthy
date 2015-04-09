class Tag < ActiveRecord::Base
   has_many :restaurants
   has_many :foods
   has_many :menu_groups
end