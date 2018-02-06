class Tag < ActiveRecord::Base
   has_and_belongs_to_many :restaurants
   has_and_belongs_to_many :menu_groups
   has_and_belongs_to_many :foods
   has_and_belongs_to_many :ingredients
   has_many :photos, as: :photo
   has_many :reviews, as: :review

   #TODO
   #has_and_belongs_to_many :tags, as: :parent_tag
   validates :name, presence: true

   before_validation :normalize_tag_name

   enum variety: [ :ingredient, :restaurant, :diet ]

   def self.save_tags(tags)
      tags.split(',').map{ |tag_name|
         find_or_create_by(name: tag_name.parameterize)
      }.flatten.uniq
   end

   private
   def normalize_tag_name
      self.name = self.name.parameterize
    end
end
