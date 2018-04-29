class Tag < ActiveRecord::Base
   has_and_belongs_to_many :restaurants
   has_and_belongs_to_many :menu_groups
   has_and_belongs_to_many :foods
   has_and_belongs_to_many :ingredients
   has_many :reviews, as: :review
   has_attached_file :icon,
    source_file_options: { all: "-auto-orient"},
    styles: {
      tiny: "32x32#",
      small: "50x50#",
      medium: "75x75#",
      large: "150x150#",
      huge: "300x300#",
      original: ""
    }
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/

   #TODO
   #has_and_belongs_to_many :tags, as: :parent_tag
   validates :name, presence: true

   before_validation :normalize_tag_name

   enum variety: [ :ingredient, :restaurant, :choice, :nature ]
   # TODO change variety to String
   # self.varieties

  searchable do
    text    :name
    text    :description
    string  :variety
  end
   def self.save_tags(tags)
      tags.split(',').map{ |tag_name|
         find_or_create_by(name: tag_name.parameterize)
      }.flatten.uniq
   end

   def to_param
     "#{id}-#{name}"
   end

   private
   def normalize_tag_name
     self.name = self.name.parameterize
   end
end
