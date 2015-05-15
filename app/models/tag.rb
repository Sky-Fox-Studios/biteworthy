class Tag < ActiveRecord::Base
   has_and_belongs_to_many :restaurants
   has_and_belongs_to_many :foods
   has_and_belongs_to_many :menu_groups
   #TODO
   #has_and_belongs_to_many :tags, as: :parent_tag
   validates :name, presence: true
   
   def self.save_tags(tags)
      tags.split(',').map{ |tag_name|
         find_or_create_by(name: Tag.normalize(tag_name))
      }.flatten.uniq
   end
   
   private
   def normalize_tag_name
      self.name = Tag.normalize(self.name)
    end

    def self.normalize(tag_name)
      if tag_name then
        return tag_name.to_s.strip.gsub(/[^A-Za-z0-9-\s]+/, "").gsub(/[_\s]+/, '-').downcase
      else
        nil
      end
    end
end