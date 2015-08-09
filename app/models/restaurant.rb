class Restaurant < ActiveRecord::Base
   has_many :menu_groups, dependent: :destroy
   has_many :foods, dependent: :destroy
   has_many :stars, :as => :favoritable
   has_and_belongs_to_many :tags
end
