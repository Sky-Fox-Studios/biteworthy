class Photo < ActiveRecord::Base
   belongs_to :user
   belongs_to :photo, :polymorphic => true
   mount_uploader :url, AvatarUploader

 end
