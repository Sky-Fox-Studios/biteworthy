class Price < ActiveRecord::Base
  belongs_to :item

  validates :item_id, :price, presence: true

  def to_s
    number_with_precision(price, strip_insignificant_zeros: true);
  end

end
