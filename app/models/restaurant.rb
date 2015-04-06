class Restaurant < ActiveRecord::Base
   has_many :menu_groups, dependent: :destroy
   has_many :foods, dependent: :destroy
   has_many :favorites, :as => :favoritable

end
