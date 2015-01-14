class Restaurant < ActiveRecord::Base
   has_many :menu_groups, dependent: :destroy
end
