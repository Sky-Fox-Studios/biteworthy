class PhotoDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def display
    if photo.class == Photo::ActiveRecord_Associations_CollectionProxy
      unless photo.empty?
        image_tag photo.sample.url, size: "160x160"
      else
        image_tag "food_pic.png", size: "160x160"
      end
    elsif photo
      image_tag photo.url, size: "160x160"
    else
      image_tag "food_pic.png", size: "160x160"
    end
  end

end
