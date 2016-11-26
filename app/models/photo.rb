class Photo < ActiveRecord::Base
   belongs_to :user
   belongs_to :photo, :polymorphic => true
   has_attached_file :image
   #  styles: { large: "1000x1000", medium: "300x300>", thumb: "100x100>", icon: "32x32>" },
   #  default_url: ":rails_root/public/:style/missing.png",
   #  path: ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename"

   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

   enum image_type: [
     :basic,
     :banner,
     :icon]

   def to_param
     "#{id}-#{name.parameterize}"
   end
 end
