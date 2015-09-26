module ApplicationHelper

  def price_to_s(price)
    number_with_precision(price, strip_insignificant_zeros: true);
  end
end
