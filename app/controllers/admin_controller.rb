class AdminController < ApplicationController
  before_filter :authenticate_user!

  def home

  end

  def save_images(object, images)
    images.each do |image|
      object.photos.new(user_id: current_user.id, photo_type: object.class.to_s, image: image).save
    end
  end
end
