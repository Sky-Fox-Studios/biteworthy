module ApplicationHelper

  def price_to_s(price)
    if price >= 1
      "$#{number_with_precision(price, strip_insignificant_zeros: true)}"
    elsif price > 0
      "#{number_with_precision(price, precision: 2).sub(/^[0.]*/,"")}¢"
    elsif price != 0
      "#{price}"
    end
  end

  def show_image(object, ratio: "160x160", size: :four_by_three)
    if object.photos.present?
      image_tag object.photos.sample.image(size)
    else
      case object.class.to_s
      when "Restaurant"
        image_tag "logo_pic.png", ratio: ratio
      when "Item"
        image_tag "food_pic.png", ratio: ratio
      when "Food"
        image_tag "food_pic.png", ratio: ratio
      when "Tag"
        image_tag "image_here.png", ratio: ratio
      when "Extra"
        image_tag "image_here.png", ratio: ratio
      else
        image_tag "image_here.png", ratio: ratio
      end
    end
  end
end
