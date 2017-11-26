class PhotoDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def display(ratio = "160x160", size = :four_by_three)
    if photo.class == Photo::ActiveRecord_Associations_CollectionProxy
      unless photo.empty?
        #TODO slick slider of images
        image_tag photo.sample.image(size)
      else
        image_tag "food_pic.png", ratio: ratio
      end
    elsif photo
      image_tag photo.image(size)
    else
      image_tag "food_pic.png", ratio: ratio
    end
  end
end
