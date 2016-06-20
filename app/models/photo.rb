
class Photo < ActiveRecord::Base
   belongs_to :user
   belongs_to :photo, :polymorphic => true
   has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>", icon: "32x32>" },
    default_url: ":rails_root/public/images/:style/missing.png",
    path: ":rails_root/public/images/:style/:filename"
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

   enum image_type: [
     :basic,
     :banner,
     :icon]

   def to_param
     "#{id}-#{name.parameterize}"
   end



 end
