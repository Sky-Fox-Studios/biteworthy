class Tag < ActiveRecord::Base
   has_and_belongs_to_many :restaurants
   has_and_belongs_to_many :foods
   has_and_belongs_to_many :menu_groups
    
   private
    def normalize_tag_name
      self.name = Tag.normalize(self.name)
    end

    def self.normalize(tag_name)
      if !tag_name.nil? then
        return tag_name.to_s.strip.gsub(/[^A-Za-z0-9-\s]+/, "").gsub(/[_\s]+/, '-').downcase
      else
        nil
      end
    end
end