class AdminController < ApplicationController
  before_filter :authenticate_user!

  def home

  end

  def save_images(object, images)
    images.each do |image|
      object.photos.new(user_id: current_user.id, photo_type: object.class.to_s, image: image).save
    end
  end

  def save_points(change_type)
    binding.pry
    if Point.save_for.include? self.class
      create_point(self, change_type, self.class.worth)
    end
  end

  def create_point(object, change_type, worth)
    Point.create(user_id: current_user.id,
                 object_id: object.id,
                 object_class: object.class.to_s,
                 change_type: change_type,
                 worth: worth)

  end
end
