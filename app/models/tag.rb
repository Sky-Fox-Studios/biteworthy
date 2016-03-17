class Tag < ActiveRecord::Base
   has_and_belongs_to_many :restaurants
   has_and_belongs_to_many :menu_groups
   has_and_belongs_to_many :foods
   has_and_belongs_to_many :ingredients
   has_many :photos, :as => :photo
   #TODO
   #has_and_belongs_to_many :tags, as: :parent_tag
   validates :name, presence: true

   before_validation :normalize_tag_name

   def self.save_tags(tags)
      tags.split(',').map{ |tag_name|
         find_or_create_by(normalized_name: tag_name.parameterize).update(name: tag_name)
      }.flatten.uniq
   end

   private
   def normalize_tag_name
      self.name = self.name.parameterize
    end
end
